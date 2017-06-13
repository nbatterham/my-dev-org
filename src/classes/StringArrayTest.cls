public class StringArrayTest {
    public static List<String> generateStringArray(Integer n)
    {
        List<String> StringArray = new List<String>();
        for(Integer i = 0; i < n; i++)
        {
            StringArray.add('Test '+i);
        }
        return StringArray;
    }
}