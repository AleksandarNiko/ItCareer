class Program
{
    static void Main()
    {
        int n = int.Parse(Console.ReadLine());
        List<int> sheep = new List<int>();

        for (int i = 1; i <= n; i++)
        {
            sheep.Add(i);
        }

        List<List<int>> permutations = new List<List<int>>();

        GeneratePermutations(sheep, 0, permutations);

        permutations = permutations
            .OrderBy(p => string.Join(" ", p))
            .ToList();

        for (int i = 0; i < permutations.Count; i++)
        {
            Console.WriteLine($"{i + 1}: {string.Join(" ", permutations[i])}");
        }
    }
    static void GeneratePermutations(List<int> sheep, int index, List<List<int>> permutations)
    {
        if (index == sheep.Count - 1)
        {
            permutations.Add(new List<int>(sheep));
            return;
        }
        for (int i = index; i < sheep.Count; i++)
        {
            Swap(sheep, index, i);
            GeneratePermutations(sheep, index + 1, permutations);
            Swap(sheep, index, i);
        }
    }
    static void Swap(List<int> sheep, int i, int j)
    {
        int temp = sheep[i];
        sheep[i] = sheep[j];
        sheep[j] = temp;
    }
}

/*
1: 1 2 3
2: 1 3 2
3: 2 1 3
4: 2 3 1
5: 3 1 2
6: 3 2 1
*/
