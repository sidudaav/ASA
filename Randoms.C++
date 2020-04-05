#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <fstream>

using namespace std;

int size(int s)
{
int size = s;
vector<int> randoms(size); // initial random vector
vector<int> new_randoms(size); // the random vector we multiply by

bool iszero = true; // checks if the array is all 0 values
int total = 1; //counts number of iterations

for(int i = 0; i < size; ++i) {
    randoms[i] = rand() % 10;
} // generates the inital multiplication vector 



for (int i = 0; i < size; ++i)
    {
        if(randoms[i] != 0)
        {
            iszero = false;
        }
    } // checks to see if initial vector is all 0

    iszero = false;
    total = 1;

    while(iszero == false) {
        iszero = true;

        for(int i = 0; i < size; ++i) {
            new_randoms[i] = rand() % 10;
        } // generates the random multiplication vector 

        for(int i = 0; i < size; ++i) {
            randoms[i] = randoms[i] * new_randoms[i];
        } // multiplies the vectors

        for (int i = 0; i < size; i++)
        {
            if(randoms[i] != 0)
            {
                iszero = false;
            }//if
        }//for
        total = total + 1;
    }
    return total;
}
 
 int min_value(vector<int> v) {
    int smallest_element = v[0]; //let, first element is the smallest one
    for(int i = 1; i < v.size(); i++)  //start iterating from the second element
    {
        if(v[i] < smallest_element)
        {
        smallest_element = v[i];
        }
    }
    return smallest_element;
}

int max_value(vector<int> v) {
    int largest_element = v[0]; //let, first element is the smallest one
    for(int i = 1; i < v.size(); i++)  //start iterating from the second element
    {
        if(v[i] > largest_element)
        {
        largest_element = v[i];
        }
    }
    return largest_element;
}

void write_csv(string filename, string colname, vector<int> vals) {
    ofstream File; //create the file
     File.open("/Users/siddharthjha/Documents/MATLAB/C++/values.csv");

     File << colname << '\n';
    
    for(int i = 0; i < vals.size(); ++i) //send data
    {
        File << vals.at(i) << "\n";
    }//for loop
    
    File.close(); //close the file
}

int main() {
     srand(time(NULL));

    int length ; // length of the random vectors
    int iterations; // number of times we simulate

    cin >> length;
    cin >> iterations;

    vector<int> totals(iterations); //raw total values
    vector<int> sorted(iterations); // sorted total values

    for(int i = 0; i < iterations; ++i) {
        totals[i] = size(length);
    }//for loop

    sorted = totals; //sort all the values
    sort(sorted.begin(), sorted.end()); //sort all the values

    write_csv("values", "tries", sorted);

} 
