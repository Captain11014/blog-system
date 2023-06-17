<template>
  <div class="MyBlog">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item prop="status">
        <el-select v-model="queryParams.status" clearable placeholder="请选择状态">
          <el-option
            v-for="item in statusOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <!-- <el-form-item label="作者" prop="nickname">
        <el-input
          v-model="queryParams.params.nickname"
          placeholder="请输入作者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核时间" prop="auditTime">
        <el-date-picker
          clearable
          v-model="queryParams.auditTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择审核时间"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="审核人id" prop="auditUserId">
        <el-input
          v-model="queryParams.auditUserId"
          placeholder="请输入审核人id"
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
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd">创作</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >审核</el-button>
      </el-col>-->
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
    </el-row>

    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键" align="center" prop="id" /> -->
      <el-table-column label="标题" align="center" prop="title">
        <template slot-scope="scope">
          <el-link
            type="primary"
            :underline="false"
            @click="toArticleDetail(scope.row.id)"
          >{{scope.row.title}}</el-link>
        </template>
      </el-table-column>
      <!-- <el-table-column label="文章内容" align="center" prop="content" /> -->
      <!-- <el-table-column label="作者id" align="center" prop="userId" /> -->
      <el-table-column label="作者" align="center" prop="user.nickname" />
      <el-table-column label="审核状态" align="center" prop="status">
        <template slot-scope="scope">
          <span v-if="scope.row.status === ARTICLE_STATUS_AUDIT" style="color:#409EFF">审核中</span>
          <span v-if="scope.row.status === ARTICLE_STATUS_TRUE" style="color:#67C23A">审核通过</span>
          <span v-if="scope.row.status === ARTICLE_STATUS_FALSE" style="color:#F56C6C">审核未通过</span>
        </template>
      </el-table-column>
      <el-table-column label="审核时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime,'{y}-{m}-{d}')}}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="审核人id" align="center" prop="auditUserId" /> -->
      <!-- <el-table-column label="审核人" align="center" prop="auditUser.nickname" /> -->
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">
            <!-- 修改 -->
            <span >修改</span>
            <!-- v-if="scope.row.status != ARTICLE_STATUS_FALSE"<span v-else>重新提交</span> -->
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改文章博客对话框 -->
    <el-dialog :title="title" :visible.sync="open" lock-scroll top="0" width="80%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题" />
        </el-form-item>
        <!-- <div class="el-dialog-div"> -->
        <el-form-item label="文章内容">
          <editor v-model="form.content" :height="350" />
          <!-- <el-input v-model="form.content" placeholder="请输入内容" /> -->
        </el-form-item>
        <!-- </div> -->
        <!-- <el-form-item label="作者用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入作者用户id" />
        </el-form-item>-->
        <!-- <el-form-item label="审核时间" prop="auditTime">
          <el-date-picker clearable
            v-model="form.auditTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择审核时间">
          </el-date-picker>
        </el-form-item>-->
        <!-- <el-form-item label="审核人id" prop="auditUserId">
          <el-input v-model="form.auditUserId" placeholder="请输入审核人id" />
        </el-form-item>-->
        <!-- <el-form-item label="删除标志" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标志" />
        </el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <!-- <el-form-item label="审核" prop="status">
          <el-radio v-model="form.status" label="0">审核中</el-radio>
          <el-radio v-model="form.status" label="1">审核通过</el-radio>
          <el-radio v-model="form.status" label="2">审核不通过</el-radio>
        </el-form-item>-->
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listArticle,
  getArticle,
  delArticle,
  addArticle,
  updateArticle,
  listjoin
} from "@/api/system/article";

//审核状态（0代表审核中 1代表审核通过 2代表审核未通过）

export default {
  name: "MyBlog",
  //props传递的值不允许更改
  props: {
    userId: Number
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      //审核中
      ARTICLE_STATUS_AUDIT: "0",
      //审核通过
      ARTICLE_STATUS_TRUE: "1",
      //审核未通过
      ARTICLE_STATUS_FALSE: "2",
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 文章博客表格数据
      articleList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        content: null,
        userId: null,
        status: null,
        auditTime: null,
        auditUserId: null
      },
      //审核状态（0代表审核中 1代表审核通过 2代表审核未通过）
      statusOptions: [
        {
          value: "0",
          label: "审核中"
        },
        {
          value: "1",
          label: "审核通过"
        },
        {
          value: "2",
          label: "审核未通过"
        }
      ],
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    };
  },
  created() {
    // this.getList();
    // alert(this.queryParams.userId)
  },

  watch: {
    // userId: function(n, o) {
    //   console.log(n);
    //   this.queryParams.userId = n;
    //   this.getList();
    // }
  },

  methods: {
    /** 查询文章博客列表 */
    getList() {
      this.loading = true;
      this.queryParams.userId = this.userId;
      console.log(this.queryParams);
      listjoin(this.queryParams).then(response => {
        this.articleList = response.rows;
        console.log(response);
        this.total = response.total;
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
        title: null,
        content: null,
        userId: null,
        status: null,
        auditTime: null,
        auditUserId: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
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
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加文章博客";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getArticle(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文章博客";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.form.userId = this.userId;
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            //如果审核未通过，重新提交则文章状态从新变为审核中
            if(this.form.status == this.ARTICLE_STATUS_FALSE){
              this.form.status = this.ARTICLE_STATUS_AUDIT;
            }

            updateArticle(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addArticle(this.form).then(response => {
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
      this.$modal
        .confirm('是否确认删除文章博客编号为"' + ids + '"的数据项？')
        .then(function() {
          return delArticle(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/article/export",
        {
          ...this.queryParams
        },
        `article_${new Date().getTime()}.xlsx`
      );
    },
    //前往文章页面
    toArticleDetail(id) {
      // this.$router.push({
      //   path:'/articleDetail',
      //   params:{
      //     articleId:id
      //   }
      // })

      let url = this.$router.resolve({
        path: "/articleDetail",
        query: {
          articleId: id
        }
      }).href;

      window.open(url, "_blank");
    }
  }
};
</script>

<style lang="scss">
.el-dialog-div {
  height: 50vh;
  overflow-x: hidden;
}

.el-dialog {
  height: 100%; /* 设置高度为80% */
  overflow: hidden; /* 溢出部分隐藏 */
}
.el-dialog:not(.is-fullscreen) {
  margin-top: 0vh !important;
}

.el-dialog__body {
  padding: 2px 20px;
}

.el-dialog__footer {
  padding: 2px 20px 2px;
}
</style>
