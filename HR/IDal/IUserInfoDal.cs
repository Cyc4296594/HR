using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDal
{
    /// <summary>
    /// 用户信息借口
    /// </summary>
    public interface IUserInfoDal
    {
        /// <summary>
        /// 判断旧密码是否正确
        /// </summary>
        /// <param name="ui_id">账户id</param>
        /// <param name="oldPwd">旧密码</param>
        /// <returns></returns>
        int FindPwd(int ui_id,string oldPwd);

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="ui_id">账户信息编号</param>
        /// <param name="newPwd">新密码</param>
        /// <returns></returns>
        int AlterPwd(int ui_id,string newPwd);
    }
}
