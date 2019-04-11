#标题#
##1.Setext形式##
H1
====
H2
----
##2.atx形式##
#H1#
##H2##
###H3###
####H4####
#####H5#####


#引用#

##1.引用内容##
>引用内容

##2.多行引用##
>多行引用
>可以在每行前加`>`
>
>如果仅在第一行使用`>`，
后面相邻的行即使省略`>`，也会变成引用内容

> 如果引用内容需要换行，  
> 可以在行末尾添加两个空格
> 
> 也可以在引用内容中加一个空行
 
##3.嵌套引用##
>也可以在引用中
> >使用嵌套引用  

##4.其他 Markdown##
> 在引用中可以使用其他任何 *Markdown* 语法

#列表#
无序列表
----
* 可以使用`*`作为标记
+ 也可以用`+`
- 或者`-`

有序列表
----
1. 有序列表以数字和`.`开始
2. 数字的序列并不会影响生成的列表序列
3. 但仍然推荐按照自然顺序（1.2.3...）编写

嵌套的列表
----
1. 第一层
	+ 1-1
	+ 1-2
2. 无序列表和有序列表可以随意互相嵌套
	1. 2-1
	2. 2-2

语法和用法
----
1. 无序列表项的开始是：符号 空格；
2. 有序列表项的开始是：数字`.` 空格；
3. 空格至少为一个，多个空格将被解析为一个；
4. 如果仅需要在行前显示数字和`.`：  
05\. 可以使用：数字\. 来取消显示为列表

#代码#
##代码块##
	<html>		//	Tab开头
		<title>Markdown</title>
	</html>	//	四个空格开头
##行内代码##
`<title>Markdown</title>`

#分割线#
1.可以在一行中使用三个或更多的`*`、`-`或`_`来添加分割线（`<hr>`）:

****

----

____

2.多个字符之间可以有空格（空白符），但不能有其他字符：
* * *
- - -

#超链接#
##行内式##
1. 普通链接  
	[Google](http://www.google.com)
2. 指向本地文件的链接  
	[icon.png](/Users/qingzou/Desktop/D7F8F434C607345FFFDE4AF95DCB1D29.gif)
3. 包含'title'的链接  
	[Google](http://www.google.com "Google")
	
##参考式##
[Google][]
[Google]: http://www.google.com "Google"

##自动链接##
<http://www.google.com>

<123@email.com>

#图像#
##行内式##
![GitHub](https://avatars2.githubusercontent.com/u/3265208?v=3&s=100 "GitHub,Social Coding")

##参考式##
![Github][github]
[github]: https://avatars2.githubusercontent.com/u/3265208?v=3&s=100 "GitHub,Social Coding"

<img src="https://avatars2.githubusercontent.com/u/3265208?v=3&s=100" alt="GitHub" title="GitHub,Social Coding" width="50" height="50" />


#强调#
1. 使用 * * 或 _ _ 包括的文本会被转换为 <em></em> ，通常表现为斜体：  
	这是用来 *演示* 的 _文本_
2. 使用 ** ** 或 __ __ 包括的文本会被转换为 <strong></strong>，通常表现为加粗：  
	这是用来 **演示** 的 __文本__
3. 用来包括文本的 * 或 _ 内侧不能有空白，否则 * 和 _ 将不会被转换（不同的实现会有不同的表现）：  
	这是用来 * 演示* 的 _文本 _
4. 如果需要在文本中显示成对的 * 或 _，可以在符号前加入 \ 即可：  
	这是用来 \*演示\* 的 \_文本\_
5. *、**、_ 和 __ 都必须 成对使用 。

#字符转义#
`\`用于插入在Markdown语法中有特殊作用的字符

#删除线#
~~这是删除线~~  
**!!!没起作用**

#代码块和语法高亮#
```javascript
window.addEventListener('load', function() {
  console.log('window loaded');
});
```
**!!!没起作用**


#表格#
##单元格和表头##
|		name		| 	age	|
|	----------	| 	---	|
|	LearnShare	| 	12	|
|		Mike 		| 	32	|

##对齐##
| left | center | right |
| :--- | :---: | ---: |
| aaaa | bbb | ccc |
| a | b | c |

##插入其他内容##
|     name     | age |             blog                |
| ------------ | --- | ------------------------------- |
| _LearnShare_ |  12 | [LearnShare](http://xianbai.me) |
| __Mike__     |  32 | [Mike](http://mike.me)          |

#Task List#
- [ ] Eat
- [x] Code
  - [x] HTML
  - [x] CSS
  - [x] JavaScript
- [ ] Sleep


















