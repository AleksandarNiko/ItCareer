
decimal bgn = decimal.Parse(Console.ReadLine());

decimal exchangeRate = decimal.Parse(Console.ReadLine());

decimal commission = decimal.Parse(Console.ReadLine());

if(bgn < 0 || exchangeRate < 0 || (commission < 0 || commission > 100))
{
    Console.WriteLine("Invalid input data!");
    return;
}

decimal eurBeforeTax= bgn / exchangeRate;
decimal commissionAmount = eurBeforeTax * (commission / 100);
decimal eurAfterTax = eurBeforeTax - commissionAmount;

Console.WriteLine($"Final amount: {eurAfterTax:f2} EUR");
