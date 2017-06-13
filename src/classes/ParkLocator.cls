public class ParkLocator {

    static public String[] country(String c)
    {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(c);
    }
}