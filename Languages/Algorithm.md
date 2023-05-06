
```cpp
#include <cstdio>
#include <cstring>
 
using namespace std;
 
int T, n, sum, w[205], lim; // w[i]: 物品 i 的价值
bool dp[20005];
 
int main() {
  while (1 == scanf("%d", &T)) {
    while (T-->0) {
      sum = 0;
      scanf("%d", &n); // 输入物品总数
      for (int i = 0; i < n; ++i) {
        scanf("%d", w + i); // 逐个输入物品价值 from i = 0 ... 1
        sum += w[i];
      }
      lim = sum >> 1; // 取总和的一半为背包容量上限
      memset(dp, false, sizeof(dp));
      dp[0] = true;
      for (int i = 0; i < n; ++i) {
        for (int j = lim; j >= w[i]; --j) {
          if (dp[j - w[i]])
            dp[j] = true;
        }
      }
      for (int i = lim; i >= 0; --i) {
        if (dp[i]) { // 找到最大的可达到的 sum
          printf("%d\n", sum - i - i);
          break;
        }
      }
    }
  }
}
```

从物品 0 到 n（选中物品 i ）