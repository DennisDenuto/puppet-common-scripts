addSbtPlugin("me.lessis" % "np" % "0.2.0")

seq(npSettings:_*)

(NpKeys.defaults in (Compile, NpKeys.np)) ~= {
  _.copy(org="com.dl", version="1.0-SNAPSHOT")
  }
