class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int getPivot(List<int> nums) {
    double module = double.infinity;
    int min = 0;
    final firstList = nums.sublist(0, nums.length ~/ 2).reversed.toList();
    final seconList = nums.sublist(nums.length ~/ 2, nums.length);

    final lists = [firstList, seconList];
    for (List list in lists) {
      for (int item in list) {
        if (item == 0) return 0;
        if (((item > 0) ? item - 0 : 0 - item) < module) {
          module = (item > 0) ? item.toDouble() : -item.toDouble();
          min = item;
        }
      }
    }
    return min;
  }

  TreeNode? sortedArrayToBST(List<int> nums) {
    TreeNode pivot = TreeNode();
    pivot.val = getPivot(nums);

    for (int num in nums) {
      TreeNode node = pivot;

      while (true) {
        print(num);
        if (num < node.val) {
          if (node.left != null) {
            node = node.left!;
          } else {
            node.left = TreeNode();
            node.left!.val = num;
            break;
          }
        } else {
          if (node.right != null) {
            node = node.right!;
          } else {
            node.right = TreeNode();
            node.right!.val = num;
            break;
          }
        }
      }
    }

    return pivot;
  }
}
