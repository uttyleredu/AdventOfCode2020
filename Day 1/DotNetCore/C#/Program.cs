using System;
using System.IO;
using System.Linq;
namespace C_
{
    class Program
    {
        static void Main(string[] args)
        {
            if (!File.Exists(args[0]))
            {
                Console.WriteLine("File does not exist. Exiting.");
                Environment.Exit(1);
            }
            var nums = System.IO.File.ReadAllLines(args[0]).Select(n => Int32.Parse(n)).ToArray();
            var part1 = Solver(nums);
            int part2 = 0;
            foreach (var num in nums)
            {
                part2 = Solver(nums, 2020-num);
                if (part2 > 0)
                    break;
            }
            Console.WriteLine("Part 1: " + part1);
            Console.WriteLine("Part 2: " + part2);
        }

        static int Solver(int[] nums, int target=2020)
        {
            foreach (var num in nums)
            {
                var dif = target-num;
                if (nums.Contains(dif))
                {
                    if (target == 2020)
                        return num*dif;
                    else
                        return (2020-target)*num*dif;
                }
            }
            return 0;
        }
    }
}
