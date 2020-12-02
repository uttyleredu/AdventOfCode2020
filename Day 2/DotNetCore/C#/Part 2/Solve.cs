using System;
using System.IO;
using System.Linq;

namespace Day_2
{
    class Part2
    {
        static void Main(string[] args)
        {
            if (!File.Exists(args[0]))
            {
                Console.WriteLine("File does not exist. Exiting.");
                Environment.Exit(1);
            }

            var rules = System.IO.File.ReadAllLines(args[0]).ToArray();
            var correct = 0;

            foreach (var rule in rules)
            {
                var checker = rule.Split(" ");

                var range = checker[0].Split("-");
                var letter = char.Parse(checker[1].Substring(0, 1));
                var pw = checker[2];

                if (letter == pw.ToCharArray()[int.Parse(range[0])-1] ^ letter == pw.ToCharArray()[int.Parse(range[1]) - 1])
                {
                    correct++;
                }

            }
            Console.WriteLine(correct);


        }
    }
}
