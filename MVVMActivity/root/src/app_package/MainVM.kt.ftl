package ${escapeKotlinIdentifiers(packageName)}

import android.view.View
<#if viewType=="recyclerView">
import app.base.mvvm.vm.list.BaseListVM
import androidx.recyclerview.widget.RecyclerView
import app.base.view.OnItemClick
import app.base.mvvm.vm.list.BaseListAdapter
<#elseif viewType=="topPager">
import androidx.fragment.app.FragmentStatePagerAdapter
import app.base.mvvm.vm.PagerVM
<#else>
import app.base.mvvm.vm.BaseVM
</#if>
import ${escapeKotlinIdentifiers(packageName)}.di.${moduleName?cap_first}Contract

<#if viewType=="recyclerView">
class ${moduleName?cap_first}VM( repository: ${moduleName?cap_first}Contract.Repository, view: ${moduleName?cap_first}Contract.View, layoutManager: RecyclerView.LayoutManager, adapter: ${moduleName?cap_first}ListAdapter)
    :BaseListVM<${moduleName?cap_first}Contract.Repository, ${moduleName?cap_first}Contract.View, T>(repository, view, layoutManager, adapter),OnItemClick<T>{

    init {
       adapter.onItemClick = this
    }

    override fun onLoadData(page: Int) {
        TODO()
    }

    override fun onItemClick(view:View, data: T){
        TODO()
    }

}

<#elseif viewType=="topPager">
class ${moduleName?cap_first}VM(repository: ${moduleName?cap_first}Contract.Repository, view: ${moduleName?cap_first}Contract.View, pagerAdapter: FragmentStatePagerAdapter)
    :PagerVM<${moduleName?cap_first}Contract.Repository, ${moduleName?cap_first}Contract.View >(repository, view, pagerAdapter){

}

<#else>
class ${moduleName?cap_first}VM(repository: ${moduleName?cap_first}Contract.Repository, view: ${moduleName?cap_first}Contract.View)
    :BaseVM<${moduleName?cap_first}Contract.Repository, ${moduleName?cap_first}Contract.View >(repository, view){


}
</#if>
