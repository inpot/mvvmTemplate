package ${escapeKotlinIdentifiers(packageName)}

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.DiffUtil
import app.base.mvvm.vm.list.BaseListAdapter
import ${applicationPackage}.R

class ${moduleName?cap_first}ListAdapter : BaseListAdapter<T>() {

    override fun onCreateItemBinding(layoutInflater: LayoutInflater, parent: ViewGroup): ViewDataBinding
            = DataBindingUtil.inflate(layoutInflater, R.layout.list_item_${moduleName?lower_case}, parent, false)

    override fun onCreateVM(position: Int, data:T) = ${moduleName?cap_first}ListItemVM(data, onItemClick)

    /**
    * use DiffUtil to update ui when data change, dont modify
    */
    override fun addAll(listSet: MutableList<T>) {
        lists.addAll(listSet)
        notifyDataSetChanged()
    }

    /**
    * use DiffUtil to update ui when data change, dont modify
    */
    override fun setData(listSet: MutableList<T>) {
        lists.clear()
        lists.addAll(listSet)
        notifyDataSetChanged()
    }

}
