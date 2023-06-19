<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <!-- <el-form-item label="所属上级" prop="parentId">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入所属上级"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
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
      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="info" plain icon="el-icon-sort" size="mini" @click="toggleExpandAll">展开/折叠</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
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
      </el-col>-->
      <!-- <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar> -->
    </el-row>

    <!-- <el-table v-loading="loading" :data="menuList" @selection-change="handleSelectionChange"> -->
    <el-table
      v-if="refreshTable"
      :data="menuList"
      style="width: 100%;margin-bottom: 20px;margin-top: 10px;"
      row-key="id"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children'}"
    >
      <!-- <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="所属上级" align="center" prop="parentId" />-->
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
            type="text"
            v-if="scope.row.type !== 2"
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd(scope.row)"
            title="添加下级节点"
          >新增</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            :disabled="scope.row.children.length > 0"
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
    />-->

    <!-- 添加或修改菜单对话框 -->
    <!-- <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
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
    </el-dialog>-->
    <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="40%">
      <el-form
        ref="dataForm"
        :model="sysMenu"
        label-width="150px"
        size="small"
        style="padding-right: 40px;"
      >
        <el-form-item label="上级菜单" v-if="sysMenu.parentId !== undefined">
          <el-input v-model="sysMenu.parentName" :disabled="true" />
        </el-form-item>
        <el-form-item label="菜单类型" prop="type">
          <el-radio-group v-model="sysMenu.type" :disabled="typeDisabled">
            <el-radio :label="0" :disabled="type0Disabled">目录</el-radio>
            <el-radio :label="1" :disabled="type1Disabled">菜单</el-radio>
            <el-radio :label="2" :disabled="type2Disabled">按钮</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="菜单名称" prop="name">
          <el-input v-model="sysMenu.name" />
        </el-form-item>
        <el-form-item label="图标" prop="icon" v-if="sysMenu.type !== 2">
          <el-select v-model="sysMenu.icon" clearable>
            <el-option
              v-for="item in iconList"
              :key="item.class"
              :label="item.class"
              :value="item.class"
            >
              <span style="float: left;">
                <i :class="item.class"></i>
              </span>
              <span style="padding-left: 6px;">{{ item.class }}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="sysMenu.sortValue" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item prop="path">
          <span slot="label">
            <el-tooltip content="访问的路由地址，如：`sysUser`" placement="top">
              <i class="el-icon-question"></i>
            </el-tooltip>路由地址
          </span>
          <el-input v-model="sysMenu.path" placeholder="请输入路由地址" />
        </el-form-item>
        <el-form-item prop="component" v-if="sysMenu.type !== 0">
          <span slot="label">
            <el-tooltip content="访问的组件路径，如：`system/user/index`，默认在`views`目录下" placement="top">
              <i class="el-icon-question"></i>
            </el-tooltip>组件路径
          </span>
          <el-input v-model="sysMenu.component" placeholder="请输入组件路径" />
        </el-form-item>
        <el-form-item v-if="sysMenu.type === 2">
          <el-input v-model="sysMenu.perms" placeholder="请输入权限标识" maxlength="100" />
          <span slot="label">
            <el-tooltip
              content="控制器中定义的权限字符，如：@PreAuthorize(hasAuthority('bnt.sysRole.list'))"
              placement="top"
            >
              <i class="el-icon-question"></i>
            </el-tooltip>权限字符
          </span>
        </el-form-item>
        <el-form-item label="状态" prop="type">
          <el-radio-group v-model="sysMenu.status">
            <el-radio :label="'1'">正常</el-radio>
            <el-radio :label="'0'">停用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false" size="small" icon="el-icon-refresh-right">取 消</el-button>
        <el-button type="primary" icon="el-icon-check" @click="submitForm()" size="small">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {
  listMenu,
  getMenu,
  delMenu,
  addMenu,
  updateMenu
} from "@/api/system/sysMenu";

const defaultForm = {
  id: undefined,
  parentId: undefined,
  name: undefined,
  type: 0,
  path: undefined,
  component: undefined,
  perms: undefined,
  icon: undefined,
  sortValue: 1,
  status: '1'
};

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
      // 是否展开，默认全部折叠
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
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
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parentId: [
          { required: true, message: "所属上级不能为空", trigger: "blur" }
        ],
        name: [{ required: true, message: "名称不能为空", trigger: "blur" }],
        type: [
          {
            required: true,
            message: "类型(0:目录,1:菜单,2:按钮)不能为空",
            trigger: "change"
          }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ]
      },
      expandKeys: [], // 需要自动展开的项

      typeDisabled: false,
      type0Disabled: false,
      type1Disabled: false,
      type2Disabled: false,
      dialogTitle: "",
      dialogVisible: false,
      sysMenu: defaultForm,
      saveBtnDisabled: false,
      iconList: [
        {
          class: "el-icon-s-tools"
        },
        {
          class: "table"
        },
        {
          class: "el-icon-s-custom"
        },
        {
          class: "el-icon-setting"
        },
        {
          class: "el-icon-user-solid"
        },
        {
          class: "el-icon-s-help"
        },
        {
          class: "el-icon-phone"
        },
        {
          class: "el-icon-s-unfold"
        },
        {
          class: "el-icon-s-operation"
        },
        {
          class: "el-icon-more-outline"
        },
        {
          class: "el-icon-s-check"
        },
        {
          class: "el-icon-tickets"
        },
        {
          class: "el-icon-s-goods"
        },
        {
          class: "el-icon-document-remove"
        },
        {
          class: "el-icon-warning"
        },
        {
          class: "el-icon-warning-outline"
        },
        {
          class: "el-icon-question"
        },
        {
          class: "el-icon-info"
        }
      ]
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
        status: null
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
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      // this.open = true;
      // this.title = "添加菜单";\
      this.typeDisabled = false;
      this.dialogTitle = "添加下级节点";
      this.dialogVisible = true;

      this.sysMenu = Object.assign({}, defaultForm);
      this.sysMenu.id = undefined;
      if (row) {
        this.sysMenu.parentId = row.id;
        this.sysMenu.parentName = row.name;
        //this.sysMenu.component = 'ParentView'
        if (row.type === 0) {
          this.sysMenu.type = 1;
          this.typeDisabled = false;
          this.type0Disabled = false;
          this.type1Disabled = false;
          this.type2Disabled = true;
        } else if (row.type === 1) {
          this.sysMenu.type = 2;
          this.typeDisabled = true;
        }
      } else {
        this.dialogTitle = "添加目录节点";
        this.sysMenu.type = 0;
        this.sysMenu.component = "Layout";
        this.sysMenu.parentId = 0;
        this.typeDisabled = true;
      }
      console.log(this.sysMenu);
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getMenu(id).then(response => {
        console.log(response);
        this.sysMenu = response.data;
        this.dialogVisible = true;
        this.typeDisabled = true;
        this.dialogTitle = "修改节点";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["dataForm"].validate(valid => {
        if (valid) {
          console.log(this.sysMenu);
          if (this.sysMenu.id != undefined) {
            updateMenu(this.sysMenu).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.dialogVisible = false;
              this.getList();
            });
          } else {
            addMenu(this.sysMenu).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.dialogVisible = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除菜单编号为"' + ids + '"的数据项？')
        .then(function() {
          return delMenu(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    }
  }
};
</script>
