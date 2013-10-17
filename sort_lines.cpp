#include<string>
#include<vector>
#include<algorithm>
#include<fstream>

using namespace std;

int main(int argc, char **argv) {
  ifstream ifile(argv[1]);
  ofstream ofile(argv[2]);
  string line;
  vector<string> data;
  while(getline(ifile, line)) {
    data.push_back(line);
  }
  sort(data.begin(), data.end());
  for(const auto &i : data) {
    ofile << i << std::endl;
  }
  return 0;
}
