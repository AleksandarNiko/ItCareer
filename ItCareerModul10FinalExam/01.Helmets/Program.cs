class Program
{
    static void Main()
    {
        int[] volunteerSizes = Console.ReadLine()
            .Split()
            .Select(int.Parse)
            .ToArray();

        int[] helmetSizes = Console.ReadLine()
            .Split()
            .Select(int.Parse)
            .ToArray();

        Array.Sort(volunteerSizes);
        Array.Sort(helmetSizes);

        int volunteerIndex = 0;
        int helmetIndex = 0;
        int equippedVolunteers = 0;

        while (volunteerIndex < volunteerSizes.Length && helmetIndex < helmetSizes.Length)
        {
            if (helmetSizes[helmetIndex] >= volunteerSizes[volunteerIndex])
            {
                equippedVolunteers++;
                volunteerIndex++;
            }
            helmetIndex++;
        }
        Console.WriteLine(equippedVolunteers);
    }
}
