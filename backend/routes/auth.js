const express = require("express");
const router = express.Router();
const Register = require("../models/Register");
const { check, validationResult } = require("express-validator");
const auth = require("../middleware/auth");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

router.post(
  "/signup",
  [
    check("firstname", "Firstname is required").not().isEmpty(),
    check("lastname", "Lastname is required").not().isEmpty(),
    check("email", "Please include a valid email").isEmail(),
    check(
      "password",
      "Please enter a password with 8 or more characters"
    ).isLength({ min: 8 }),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { firstname, lastname, email, password, transactionPin } = req.body;

    try {
      // check if user exists
      let user = await Register.findOne({ email });

      if (user) {
        return res.status(400).json({ msg: "User already exists" });
      }

      user = new Register({
        firstname,
        lastname,
        email,
        password,
        transactionPin,
      });

      await user.save();
      const userWithoutPassword = user.toObject();
      delete userWithoutPassword.password;

      const payload = {
        user: {
          id: user.id,
        },
      };

      jwt.sign(
        payload,
        process.env.JWT_SECRET,
        { expiresIn: "3h" },
        (err, token) => {
          if (err) throw err;
          res.status(201).json({ token, user: userWithoutPassword });
        }
      );
    } catch (error) {
      console.error("Signup error:", error.message);
      res.status(500).send("Server error");
    }
  }
);

router.post(
  "/login",
  [
    check("email", "Please include a valid email").isEmail(),
    check("password", "Password is required").exists(),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { email, password } = req.body;

    try {
      const user = await Register.findOne({ email }).select("+password");
      if (!user) {
        return res.status(400).json({ msg: "Invalid credentials" });
      }

      // console.log("Input password:", password);
      // console.log("Stored hash:", user.password);

      const isMatch = await user.comparePassword(password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Invalid credentials" });
      }

      const userWithoutPassword = user.toObject();
      delete userWithoutPassword.password;

      const payload = {
        user: {
          id: user.id,
        },
      };

      jwt.sign(
        payload,
        process.env.JWT_SECRET,
        { expiresIn: "1h" },
        (err, token) => {
          if (err) throw err;

          res.status(201).json({
            token,
            user: userWithoutPassword,
            settings: {
              transactionPin: false,
            },
            // user: {
            //   id: user._id,
            //   username: user.username,
            //   email: user.email,
            //   createdAt: user.createdAt,
            // },
          });
        }
      );
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  }
);

router.get("/user", auth, async (req, res) => {
  try {
    res.json(req.user);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

module.exports = router;
