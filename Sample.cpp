#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void quickSort(vector<int> &arr, int low, int high)
{
    if (low < high)
    {
        int pivot = arr[high], i = low - 1;
        for (int j = low; j < high; j++)
        {
            if (arr[j] < pivot)
                swap(arr[++i], arr[j]);
        }
        swap(arr[i + 1], arr[high]);
        int p = i + 1;
        quickSort(arr, low, p - 1);
        quickSort(arr, p + 1, high);
    }
}

int main()
{
    vector<int> arr = {34, 7, 23, 32, 5, 62};
    quickSort(arr, 0, arr.size() - 1);
    for (int num : arr)
        cout << num << " ";
    cout << endl;
}
