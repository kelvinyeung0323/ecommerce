$(function(){
    //获取类目数据
    $.get("../../api/catalog",function(data){
        console.log(data);
     // $('#js_climit_li').empty();
       catalog(data);
    });


    function catalog(data){

        $.each(data,function(index,item){
            var catIndex = '';
            if(index == 0){
                catIndex = 'first';
            }else if(index == data.length-1){
                catIndex='last';
            }
            var html= '<li class="appliance js_toggle relative '+catIndex+'">'
                + '    <div class="category-info">'
                + '        <h3 class="category-name b-category-name"><i><img src="../images/'+item.icon +'"></i>'
                + '            <a class="ml-22" title="'+item.cat_name+'">'+item.cat_name+'</a></h3>'
                + '        <em>&gt;</em></div>'
                + '    <div class="menu-item menu-in top">'
                + '        <div class="area-in">'
                + '            <div class="area-bg">'
                + '                <div class="menu-srot">';

                $.each(item.childs,function(index2,item2){

                    html+= '                    <div class="sort-side">'
                            + '                        <dl class="dl-sort">'
                            + '                            <dt><span title="'+'item2.cat_name'+'">'+item2.cat_name+'</span></dt>';

                            $.each(item.childs,function(index3,item3){
                                html+= '                            <dd><a title="'+item3.cat_name+'" href="#"><span>'+item3.cat_name+'</span></a></dd>'
                            });


                     html  += '                        </dl>'
                            + '                    </div>';

                });



                html+= '                    <div class="brand-side">'
                + '                        <dl class="dl-sort">'
                + '                            <dt><span>实力商家</span></dt>'
                + '                            <dd><a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#" rel="nofollow">'
                + '                                <span class="red">呵官方旗舰店</span></a></dd>'
                + '                        </dl>'
                + '                    </div>'
                + '                </div>'
                + '            </div>'
                + '        </div>'
                + '    </div>'
                + '    <b class="arrow"></b>'
                + '</li>';

                $('#js_climit_li').append(html);

        });



    }



});