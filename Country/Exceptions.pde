/*
  These exceptions are implemented by Nuoxi Zhang on 2022/04/01
*/


class InvalidFromInputException extends Exception
{
  InvalidFromInputException(String s)
  {
    super(s);
  }
}

class InvalidToInputException extends Exception
{
  InvalidToInputException(String s)
  {
    super(s);
  } 
}

class InvalidIntervalInputException extends Exception
{
  InvalidIntervalInputException(String s)
  {
    super(s);
  }
}
class InvalidInputNullException extends Exception
{
  InvalidInputNullException(String s)
  {
    super(s);
  }
}
class InvalidCountryException extends Exception
{
  InvalidCountryException(String s)
  {
    super(s);
  }
  
}
