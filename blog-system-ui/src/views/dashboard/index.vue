<template>
  <div class="dashboard-container">
     <div class="blogs-content">
      <div class="userInfo">
        <el-avatar class="avatar" shape="square" :size="150" fit="fill" :src="avatar"></el-avatar>
        <el-button class="editUser" type="primary" icon="el-icon-edit" @click="editUser()">编辑</el-button>
        <ul>
          <li>昵称：{{sysUser.nickname}}</li>
          <li>账户：{{sysUser.username}}</li>
          <li>描述：{{sysUser.description}}</li>
        </ul>
      </div>

      <el-divider></el-divider>

      <!-- <el-tabs :value="tabVal" class="usertab" @tab-click="myBlog" type="border-card">
        <el-tab-pane name="blog" label="我的博客">
          <my-blog ref="myblog" :userId="sysUser.id"></my-blog>
        </el-tab-pane>
        <el-tab-pane name="sc" label="我的收藏">
          <my-favorite ref="myFavorite"></my-favorite>
        </el-tab-pane>
        <el-tab-pane name="ls" label="浏览历史">
          <my-browsing-history ref="myBrowsingHistory" :userId="sysUser.id"></my-browsing-history>
        </el-tab-pane>
      </el-tabs> -->

      <!-- 添加或修改用户对话框 -->
      <el-dialog title="编辑个人信息" :visible.sync="open" width="500px" append-to-body>
        <el-form ref="form" :model="sysUser" :rules="rules" label-width="80px">
          <!-- <el-form-item label="用户名" prop="username">
            <el-input v-model="form.username" placeholder="请输入用户名" />
          </el-form-item>-->
          <!-- <el-form-item label="密码" prop="password">
            <el-input v-model="form.password" placeholder="请输入密码" />
          </el-form-item>-->

          <el-form-item label="昵称" prop="nickname">
            <el-input v-model="sysUser.nickname" placeholder="请输入昵称" />
          </el-form-item>
          <!-- <el-form-item label="邮箱" prop="email">
            <el-input v-model="sysUser.email" placeholder="请输入手机" />
          </el-form-item>-->
          <!-- <el-form-item label="头像" prop="headUrl">
            <el-input v-model="sysUser.headUrl" placeholder="请输入头像地址" />
          </el-form-item>-->

          <el-form-item label="描述" prop="description">
            <el-input v-model="sysUser.description" placeholder="请输入描述" />
          </el-form-item>
          <el-form-item label="头像" prop="headUrl">
            <el-upload
              class="avatar-uploader"
              :action="uploadImgUrl"
              :show-file-list="false"
              :on-success="uploadSuccess"
            >
              <img v-if="sysUser.headUrl" :src="baseUrl+sysUser.headUrl" class="avatar" />
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import NavigationBar from "@/views/ordinaryuser/components/navigationBar";
import { selectSysUserByUsername, updateUser } from "@/api/system/sysUser";
// import {
//   listUser,
//   getUser,
//   delUser,
//   addUser,
//   updateUser
// } from "@/api/system/sysUser";
import MyFavorite from "@/views/ordinaryuser/components/myFavorite";
import MyBlog from "@/views/ordinaryuser/components/myBlog";
import MyBrowsingHistory from "@/views/ordinaryuser/components/myBrowsingHistory"

export default {
  name: 'Dashboard',
  components: {
    NavigationBar,
    MyFavorite,
    MyBlog,
    MyBrowsingHistory
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  },

   data() {
    return {
      avatar: "",
      sysUser: {
        id: undefined,
        username: undefined,
        password: undefined,
        birthday: undefined,
        nickname: undefined,
        email: undefined,
        headUrl: undefined,
        openId: undefined,
        description: undefined,
        status: undefined
      },
      //标签页的初始值
      tabVal: this.$route.query.tabVal, //"blog",
      open: false,
      dialogImageUrl: "",
      dialogVisible: false,
      baseUrl: process.env.VUE_APP_BASE_API,
      uploadImgUrl: process.env.VUE_APP_BASE_API + "/common/upload",
      // 表单校验
      rules: {
        nickname: [
          { required: true, message: "昵称不能为空", trigger: "blur" }
        ],
        username: [
          { required: true, message: "用户名不能为空", trigger: "blur" }
        ]
      }
      //根据用户是否登录 ： true：用户已登录，false：未登录
    };
  },
  created() {
    this.getInfo();
  },

   methods: {
    //获取用户信息
    getInfo() {
      //获取当前登录用户名
      const username = this.$store.getters.name;
      //根据用户名获取用户信息
      if (username) {
        console.log("执行...");
        selectSysUserByUsername(username).then(response => {
          console.log(response);
          this.sysUser = response.data;
          //判断用户头像是否为空，若为空则设置默认值
          if (this.sysUser.headUrl != "" && this.sysUser.headUrl != null) {
            this.avatar = this.baseUrl + this.sysUser.headUrl;
          } else {
            this.avatar = this.$store.getters.avatar;
          }
          // this.tabInit(this.tabVal);
        });
      }
    },

    //上传成功的回调函数
    uploadSuccess(response, file, fileList) {
      this.dialogImageUrl = response.url;
      console.log(response);
      this.sysUser.headUrl = response.fileName;
    },

    //提交按钮
    submitForm() {
      console.log(this.sysUser);
      this.sysUser.password = undefined;
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateUser(this.sysUser).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getInfo();
          });
        }
      });
    },

    //弹出编辑对话框
    editUser() {
      this.open = true;
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.getInfo();
    },
    //标签页点击
    myBlog(value) {
      //拿到标签页name值
      let name = value.name;
      console.log(value.name);

      switch (name) {
        case "sc":
          this.$nextTick(() => {
            this.$refs.myFavorite.getList();
          });
          break;
        case "blog":
          this.$nextTick(() => {
            this.$refs.myblog.getList();
          });
          break;
        case "ls":
          this.$nextTick(() => {
            this.$refs.myBrowsingHistory.getList();
          });
          break;
      }
    },
    //标签初始化
    tabInit(name) {
      //拿到标签页name值
      switch (name) {
        case "sc":
          this.$nextTick(() => {
            this.$refs.myFavorite.getList();
          });
          break;
        case "blog":
          this.$nextTick(() => {
            this.$refs.myblog.getList();
          });
          break;
        case "ls":
          this.$nextTick(() => {
            this.$refs.myBrowsingHistory.getList();
          });
          break;
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.personalcenter {
  width: 100%;
  //   min-height: 100vh;
  overflow-y: hidden;
  //   border: 1px solid red;
  background-color: rgb(246, 246, 246);
}

.blogs-content {
  // margin-top: 80px;
  //   border:1px solid red;
  min-height: calc(100vh - 80px);
  width: 100%;
  position: relative;
  // left: 50%;
  // margin-left: -30%;
  background-color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);

  .userInfo {
    // border: 1px solid red;
    height: 160px;
    ul {
      list-style: none;
      float: left;
      margin-left: 160px;
      padding: 0;
      margin-top: 59px;
      width: calc(100% - 160px);
      li {
        border-bottom: 1px solid rgb(200, 198, 198);
        height: 30px;
        line-height: 30px;
      }
    }
    .avatar {
      position: absolute;
    }
    .editUser {
      position: absolute;
      right: 0;
    }
  }

  .usertab {
    min-height: calc(100vh - 290px);
  }
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>