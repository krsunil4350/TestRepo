public class Temperat {
//takes the Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh){
        Decimal cs = (fh-32)*5/9;
        	System.debug('@@@@'+cs);
        return cs.setScale(2);
    }
}