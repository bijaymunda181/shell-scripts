greeting() {
 echo My name is Bijay
 echo My sirname is Munda
 exit 10
 echo I am from Jharkhand

}
 greeting

 # you declear var in a main program, you can access in function and vice-versa.
 # Function have its own varibles

input() {
  echo First Argument - $1
  echo Second Argument - $2
  echo All Argument - $*
  echo No of Argument - $#

}

input 123 asd