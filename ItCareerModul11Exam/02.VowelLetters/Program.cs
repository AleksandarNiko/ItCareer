
string word = Console.ReadLine();
int vowelCount = 0;
foreach (char letter in word)
{
    if ("aeiouyAEIOUY".Contains(letter))
    {
        vowelCount++;
    }
}
if (vowelCount > 0)
{
    Console.WriteLine($"Vowels: {vowelCount}");
}
else
{
    Console.WriteLine("No vowels");
}