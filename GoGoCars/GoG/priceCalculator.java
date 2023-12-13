package GoG;
import java.time.LocalDate;

public class priceCalculator {

    public static float CalculatePrice(String pick_up, String drop_off, float dayPrice) throws Exception{

        String pickDay = pick_up.substring(0, 2);
        String pickMonth = pick_up.substring(3, 5);
        String pickYear = pick_up.substring(6, 8);
        String dropDays = drop_off.substring(0, 2);
        String dropMonths = drop_off.substring(3, 5);
        String dropYears = drop_off.substring(6, 8);
        float price;

        try {
            int pickupDay = Integer.parseInt(pickDay);
            int pickupMonth = Integer.parseInt(pickMonth);
            int pickupYear = Integer.parseInt(pickYear);
            int dropDay = Integer.parseInt(dropDays);
            int dropMonth = Integer.parseInt(dropMonths);
            int dropYear = Integer.parseInt(dropYears);

            LocalDate pickupDate = LocalDate.of(pickupYear, pickupMonth, pickupDay);
            LocalDate dropDate = LocalDate.of(dropYear, dropMonth, dropDay);

            float daysDifference = dropDate.toEpochDay() - pickupDate.toEpochDay();

            price = daysDifference * dayPrice;
        } catch (Exception e) {
            throw new Exception("Please insert a valid date");
        }

        return price;
    }
}
