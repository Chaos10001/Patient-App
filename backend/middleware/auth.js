const jwt = require("jsonwebtoken");
const Register = require("../models/Register");

module.exports = async (req, res, next) => {
  const token = req.header("Bearer");

  if (!token) {
    return res.status(401).json({ msg: "No token. authorization denied" });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = await Register.findById(decoded.user.id).select("-password");
    next();
  } catch (err) {
    res.status(401).json({ msg: "Token is not valid" });
  }
};
