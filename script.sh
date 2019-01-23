#!bin bash
for ((i=1;i<37;++i))
do
	wget http://www.renrentou.com/project/list/p/$i
	sed -i '624,$ d' $i
	sed -i '1,268 d' $i
	grep h4 $i | cut -d '>' -f 2 | cut -d '<' -f 1 >> company
	grep last $i | cut -d '>' -f 2 | cut -d '<' -f 1 >> location
	grep href $i | cut -d '"' -f 2 >> url
	for((j=1;j<13;++j))
	do
		var=`head -$j url|tail -1`
		wget $var
		name=`echo $var|cut -d '/' -f7`
		grep 目标金额 $name|cut -d '>' -f 5 | cut -d '<' -f1 >> target_money
		grep 融资进度 $name|cut -d '>' -f 5 | cut -d '<' -f1 >> process 
		grep 已融资 $name|cut -d '>' -f 5 | cut -d '<' -f1 >> already 
		grep 起投金额 $name|cut -d '>' -f 5 | cut -d '<' -f1 >> start_up_money
		rm $name
	done
	rm url
	rm $i
done


