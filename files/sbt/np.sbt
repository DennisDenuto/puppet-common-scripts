seq(npSettings:_*)

(NpKeys.defaults in (Compile, NpKeys.np)) ~= {
  _.copy(org="com.dl", version="1.0-SNAPSHOT")
  }
