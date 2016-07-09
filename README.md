What's ?
===============
chef で使用する ant の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://github.com/bageljp/"

cookbook "ant", git: "https://github.com/bageljp/cookbook-ant.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "ant" => {
    "user" => "user_name",
    "group" => "group_name"
  }
)
```

Recipes
----------

#### ant::default
指定したバージョンの ant をインストール。

Attributes
----------

主要なやつのみ。

#### ant::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['ant']['root_dir']</tt></td>
    <td>string</td>
    <td>ant のインストール先。</td>
  </tr>
  <tr>
    <td><tt>['ant']['dir']</tt></td>
    <td>string</td>
    <td>ant を展開する際のディレクトリ名。バージョンを入れておくと更新とか楽かも。</td>
  </tr>
</table>

