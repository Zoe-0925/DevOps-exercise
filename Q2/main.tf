locals {
  users = {
    "user1" = {
      username = "user1"
      groups   = ["group1", "group2"]
    },
    "user2" = {
      username = "user2"
      groups   = ["group2", "group3"]
    }
  }
}

resource "aws_iam_user" "user" {
  for_each = local.users

  name = each.key
}

resource "aws_iam_group" "this" {
  for_each = toset(flatten([for user, groups in local.users : groups]))

  name = each.key
}

resource "aws_iam_group_membership" "this" {
  for_each = {
    for user, info in local.users :
    user => {
      username = info.username
      groups   = info.groups
    }
  }

  name = each.key

  users = aws_iam_user.user

  group= aws_iam_group.this[each.key]


  
}