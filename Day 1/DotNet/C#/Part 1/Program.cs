using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdventOfCode2020
{
    class Program
    {
        static void Main(string[] args)
        {
            if (!File.Exists($args[0]))
            {
                Console.WriteLine("File does not exist. Exiting.")
                System.Environment.Exit(1);
            }
            string[] nums = System.IO.File.ReadAllLines(args[0]);

            int[] ints = Array.ConvertAll(nums, int.Parse);

            for (int x = 0; x<ints.Length-1; x++)
            {
                for(int y = x+1; y<ints.Length; y++)
                {
                    if (ints[x] + ints[y] == 2020)
                    {
                        Console.WriteLine(ints[x] + " + " + ints[y] + " = " + (ints[x] + ints[y]));
                        Console.WriteLine(ints[x] + " * " + ints[y] + " = " + (ints[x] * ints[y]));

                    }
                }
            }
            Console.WriteLine("done");


            Console.ReadKey();

        }
    }
}
