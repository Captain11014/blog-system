<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <!-- <el-form-item label="所属上级" prop="parentId">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入所属上级"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!-- <el-form-item label="路由地址" prop="path">
        <el-input
          v-model="queryParams.path"
          placeholder="请输入路由地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组件路径" prop="component">
        <el-input
          v-model="queryParams.component"
          placeholder="请输入组件路径"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="权限标识" prop="perms">
        <el-input
          v-model="queryParams.perms"
          placeholder="请输入权限标识"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图标" prop="icon">
        <el-input
          v-model="queryParams.icon"
          placeholder="请输入图标"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="排序" prop="sortValue">
        <el-input
          v-model="queryParams.sortValue"
          placeholder="请输入排序"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除</el-button>
      </el-col>
      <!-- <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar> -->
    </el-row>

    <!-- <el-table v-loading="loading" :data="menuList" @selection-change="handleSelectionChange"> -->
    <el-table
      :data="menuList"
      style="width: 100%;margin-bottom: 20px;margin-top: 10px;"
      row-key="id"
      :default-expand-all="false"
      :tree-props="{children: 'children'}"
    >
      <!-- <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="所属上级" align="center" prop="parentId" /> -->
      <el-table-column label="名称" align="center" prop="name" />
      <!-- <el-table-column label="类型(0:目录,1:菜单,2:按钮)" align="center" prop="type" /> -->
      <!-- <el-table-column label="路由地址" align="center" prop="path" /> -->
      <el-table-column label="组件路径" align="center" prop="component" />
      <el-table-column label="权限标识" align="center" prop="perms" />
      <el-table-column label="图标" align="center" prop="icon" />
      <el-table-column label="排序" align="center" prop="sortValue" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
            <span v-if="scope.row.status == 1">正常</span>
            <span v-if="scope.row.status == 0">停用</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <!-- <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    /> -->

    <!-- 添加或修改菜单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属上级" prop="parentId">
          <el-input v-model="form.parentId" placeholder="请输入所属上级" />
        </el-form-item>
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="路由地址" prop="path">
          <el-input v-model="form.path" placeholder="请输入路由地址" />
        </el-form-item>
        <el-form-item label="组件路径" prop="component">
          <el-input v-model="form.component" placeholder="请输入组件路径" />
        </el-form-item>
        <el-form-item label="权限标识" prop="perms">
          <el-input v-model="form.perms" placeholder="请输入权限标识" />
        </el-form-item>
        <el-form-item label="图标" prop="icon">
          <el-input v-model="form.icon" placeholder="请输入图标" />
        </el-form-item>
        <el-form-item label="排序" prop="sortValue">
          <el-input v-model="form.sortValue" placeholder="请输入排序" />
        </el-form-item>
        <el-form-item label="删除标志" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标志" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMenu, getMenu, delMenu, addMenu, updateMenu } from "@/api/system/sysMenu";

export default {
  name: "Menu",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 菜单表格数据
      menuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parentId: null,
        name: null,
        type: null,
        path: null,
        component: null,
        perms: null,
        icon: null,
        sortValue: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parentId: [
          { required: true, message: "所属上级不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "类型(0:目录,1:菜单,2:按钮)不能为空", trigger: "change" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询菜单列表 */
    getList() {
      this.loading = true;
      listMenu(this.queryParams).then(response => {
        this.menuList = response.data;
        // this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        parentId: null,
        name: null,
        type: null,
        path: null,
        component: null,
        perms: null,
        icon: null,
        sortValue: null,
        status: null,
        createTime: null,
        updateTime: null,
        delFlag: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加菜单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改菜单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMenu(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMenu(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除菜单编号为"' + ids + '"的数据项？').then(function() {
        return delMenu(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/menu/export', {
        ...this.queryParams
      }, `menu_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
