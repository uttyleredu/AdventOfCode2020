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

            for (int x = 0; x < ints.Length - 2; x++)
            {
                for (int y = x + 1; y < ints.Length-1; y++)
                {
                    for(int z = y + 1; z < ints.Length; z++)
                    {
                        if (ints[x] + ints[y] + ints[z] == 2020)
                        {
                            Console.WriteLine(ints[x] + " + " + ints[y] + " + " + ints[z] + " = " + (ints[x] + ints[y] + ints[z]));
                            Console.WriteLine(ints[x] + " * " + ints[y] + " * " + ints[z] + " = " + (ints[x] * ints[y] * ints[z]));

                        }
                    }
                }
            }

            Console.WriteLine("done");

            Console.ReadKey();

        }
    }
}
