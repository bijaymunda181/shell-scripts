#When we have some repetitive content then we can declare that in a variable and we can use that variable reference everywhere.
#Advantage is, if we change in place that impacts all the places where that value is used.

greeting() {
  echo Hellow, Good Morning
  echo Welcome to devops Traning
  return 10
  echo Good to Have you Hare
}
greeting
echo function Exit status - $?

# You declare var in main program, you can access that in function and vice-versa.
# Function have its own special variables

input() {
  echo First Argument  - $1
  echo Second Argument - $2
  echo All Arguments   - $*
  echo No of Arguments - $#
}

input abc 1234
