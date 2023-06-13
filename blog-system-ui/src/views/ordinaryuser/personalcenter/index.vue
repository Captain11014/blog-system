<template>
  <div class="personalcenter">
    <navigation-bar></navigation-bar>

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

      <el-tabs class="usertab" type="border-card">
        <el-tab-pane label="我的博客">我的博客</el-tab-pane>
        <el-tab-pane label="我的收藏">我的收藏</el-tab-pane>
        <el-tab-pane label="浏览历史">浏览历史</el-tab-pane>
        <!-- <el-tab-pane label="定时任务补偿">定时任务补偿</el-tab-pane> -->
      </el-tabs>

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
            <!-- <el-upload
              :limit="1"
              :action="uploadImgUrl"
              list-type="picture-card"
              :on-preview="handlePictureCardPreview"
              :on-remove="handleRemove"
              :on-success="uploadSuccess"
            >
              <img v-if="dialogImageUrl" :src="dialogImageUrl" class="avatar" />
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible">
              <img width="100%" :src="dialogImageUrl" alt />
            </el-dialog>-->
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
import NavigationBar from "@/views/ordinaryuser/components/navigationBar";
import { selectSysUserByUsername, updateUser } from "@/api/system/sysUser";
// import {
//   listUser,
//   getUser,
//   delUser,
//   addUser,
//   updateUser
// } from "@/api/system/sysUser";
export default {
  name: "personalcenter",
  components: {
    NavigationBar
  },
  data() {
    return {
      avatar: "",
      sysUser: {
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
          if (this.sysUser.headUrl != "" && this.sysUser.headUrl != null) {
            this.avatar = this.baseUrl + this.sysUser.headUrl;
          } else {
            this.avatar = this.$store.getters.avatar;
          }
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
    }
  }
};
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
  margin-top: 80px;
  //   border:1px solid red;
  min-height: calc(100vh - 80px);
  width: 60%;
  position: relative;
  left: 50%;
  margin-left: -30%;
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

  .usertab{
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