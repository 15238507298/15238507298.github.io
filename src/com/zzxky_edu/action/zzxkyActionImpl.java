package com.zzxky_edu.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zzxky_edu.beans.leaveWorde;
import com.zzxky_edu.beans.map;
import com.zzxky_edu.beans.news;
import com.zzxky_edu.beans.user;
import com.zzxky_edu.service.zzxkyService;

//Action层
public class zzxkyActionImpl<T> extends ActionSupport {

	private zzxkyService zzxkyService;

	public user user1;

	private Map<String, Object> session = ServletActionContext.getContext().getSession();

	private map map;

	private leaveWorde lword;

	private String stringIndex;

	public String getStringIndex() {
		return stringIndex;
	}

	public void setStringIndex(String stringIndex) {
		this.stringIndex = stringIndex;
	}

	public leaveWorde getLword() {
		return lword;
	}

	public void setLword(leaveWorde lword) {
		this.lword = lword;
	}

	public map getMap() {
		return map;
	}

	public void setMap(map map) {
		this.map = map;
	}

	public void setZzxkyService(zzxkyService zzxkyService) {
		this.zzxkyService = zzxkyService;
	}

	public user getUser1() {
		return user1;
	}

	public void setUser1(user user) {
		this.user1 = user;
	}

	// 注册用户
	public String addUser() {

		if (user1 != null && user1.getUser_name() != null && user1.getUser_telephone() != null
				&& user1.getUser_email() != null && user1.getUser_password() != null) {
			try {
				user1.setUser_registTime(new Date());
				zzxkyService.save(user1);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		}
		return "error";
	}

	// 删除用户
	public String deleteUser() {
		if (user1 != null && user1.getUser_id() != null) {
			try {
				zzxkyService.remove(user1);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		}
		return "error";

	}

	// 更新用户
	public String updateUser() {
		if (user1 != null && user1.getUser_id() != null) {
			try {
				zzxkyService.update(user1);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}

	}

	// 获取单条用户数据
	public String getUser() {
		if (user1 != null && user1.getUser_id() != null && session != null) {
			try {
				user userInfo = zzxkyService.getById(user1.getClass(), user1.getUser_id());
				session.put("userInfo", userInfo);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		}
		return "error";
	}

	// 用户登录
	public String loginUser() {
		if (user1 != null && user1.getUser_name() != null && user1.getUser_password() != null && session != null) {
			List<? extends user> userInfos = zzxkyService.findAll(user1.getClass(), user1);
			for (user user : userInfos) {
				if (user.getUser_name().equals(user1.getUser_name())
						&& user.getUser_password().equals(user1.getUser_password())) {
					// 解析日期格式
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					// 将登陆时间用于前台主页显示
					session.put("loginTime", sdf.format(user.getUser_loginTime()));
					user.setUser_loginTime(new Date());
					// 保存用户这次登陆的时间
					zzxkyService.save(user);
					// 去除用户的隐私信息
					user.setUser_password(null);
					// 保存用户的登陆数据
					session.put("userInfo", user);
					session.put("userState", 1);
					return "success";
				}

			}
		}
		if (session != null) {
			session.put("userState", 0);
			addFieldError("loginErr", "登录失败，请确认用户名和密码是否正确！");
		}

		return "error";
	}

	// 用户退出
	public String exitUser() {
		// 初始化session中的用户信息
		if (session != null) {
			session.remove("userInfo");
			session.remove("loginTime");
			session.put("userState", 0);
			return "success";
		} else {
			return "error";
		}

	}

	// 判断用户是否在线，如果在线可以回到首页
	public String judgeLogin() {
		if (session.get("userInfo") != null && session.get("loginTime") != null
				&& (int) session.get("userState") == 1) {
			return "success";

		} else {
			addFieldError("loginErr", "您的用户未登录！");
			return "error";
		}
	}

	// 查询所有导航栏信息
	public String searchMap() {
		map map = new map();
		try {
			List<? extends com.zzxky_edu.beans.map> listMap = zzxkyService.findAll(map.getClass(), map);
			listMap.sort((s1, s2) -> s1.getMap_id().compareTo(s2.getMap_id()));
			for (int i = 0; i < listMap.size(); i++) {
				if (i >= 6) {
					// 移除非法导航栏信息
					zzxkyService.remove(listMap.get(i));
					listMap.remove(i);
				}
			}
			session.put("maps", listMap);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}

	}

	// 获取单条导航栏信息
	public String searchAloneMap() {
		if (map != null && map.getMap_id() != null) {
			try {
				session.put("uMap", zzxkyService.getById(map.getClass(), map.getMap_id()));
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}

	}

	// 删除导航栏信息
	public String DeleteAloneMap() {
		if (map != null && map.getMap_id() != null) {
			try {
				com.zzxky_edu.beans.map mapOne = zzxkyService.getById(map.getClass(), map.getMap_id());
				zzxkyService.remove(mapOne);
				session.put("maps", zzxkyService.findAll(map.getClass(), map));
				return "success";

			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}
	}

	// 清空导航栏信息
	public String DeleteAllMap() {
		try {
			com.zzxky_edu.beans.map mapOne = zzxkyService.getById(map.getClass(), map.getMap_id());
			zzxkyService.remove(mapOne);
			session.put("maps", zzxkyService.findAll(map.getClass(), map));
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}

	// 添加导航栏信息
	public String addMap() {

		PrintWriter out = null;
		try {
			out = ServletActionContext.getResponse().getWriter();
			System.out.println(map.getMap_content() + "========" + map.getMap_links());
			if (map != null && map.getMap_content() != null && map.getMap_links() != null) {
				// 添加导航栏到数据库
				Integer mapNum = ((List) session.get("maps")).size();

				if (mapNum >= 6) {

					out.println("6");
					out.close();
					return "success";
				} else {
					zzxkyService.save(map);
					// 添加成功，返回ajax成功信息
					List<? extends com.zzxky_edu.beans.map> listMap = zzxkyService.findAll(map.getClass(), map);
					listMap.sort((s1, s2) -> s1.getMap_id().compareTo(s2.getMap_id()));
					for (int i = 0; i < listMap.size(); i++) {
						if (i >= 6) {
							// 移除非法导航栏信息
							zzxkyService.remove(listMap.get(i));
							listMap.remove(i);

						}
					}
					session.put("maps", listMap);

					out.println("1");
					out.close();
					System.out.println("添加成功");
					return "success";
				}

			} else {
				System.out.println("map为null");
				return "error";
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.println("9");
			out.close();
			System.out.println("map出现异常！");

			return "error";
		}
	}

	// 修改导航栏信息
	public String updateMap() {
		if (map != null && map.getMap_id() != null && map.getMap_content() != null && map.getMap_links() != null) {
			try {
				zzxkyService.update(map);
				List<? extends com.zzxky_edu.beans.map> listMap = zzxkyService.findAll(map.getClass(), map);
				listMap.sort((s1, s2) -> s1.getMap_id().compareTo(s2.getMap_id()));
				for (int i = 0; i < listMap.size(); i++) {
					if (i >= 6) {
						// 移除非法导航栏信息
						zzxkyService.remove(listMap.get(i));
						listMap.remove(i);

					}
				}
				session.put("maps", listMap);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}
		} else {
			return "error";
		}
	}

	// 查询所有留言人员信息
	public String searchWord() {
		try {
			lword = new leaveWorde();
			List<leaveWorde> lwords = (List<leaveWorde>) zzxkyService.findAll(lword.getClass(), lword);

			lwords.sort((s1, s2) -> s1.getLeaveWord_id().compareTo(s2.getLeaveWord_id()));

			Collections.reverse(lwords);

			session.put("wordS", lwords);

			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}
	}

	// 留言分页效果
	public String searchWordByPage() {
		if (lword != null && lword.getLeaveWord_id() != null) {
			// lword.getLeaveWord_id():想要获取的页面数
			List<? extends leaveWorde> wordS = zzxkyService.findByPage(lword.getClass(), "order by leaveWord_id desc",
					lword.getLeaveWord_id());
			session.put("wordPage", wordS);
			return "success";
		} else {
			return "error";
		}
	}

	// 查询单条留言
	public String findOneWord() {
		if (lword != null && lword.getLeaveWord_id() != null) {
			try {
				lword = zzxkyService.getById(lword.getClass(), lword.getLeaveWord_id());
				session.put("lword", lword);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}
	}

	// 清空所有留言
	public String removeWordAll() {
		List<leaveWorde> words = (List<leaveWorde>) session.get("wordS");
		if (words != null && words.size() >= 1) {

			try {
				for (leaveWorde leaveWorde : words) {
					zzxkyService.remove(leaveWorde);
				}

				session.remove("wordS");
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}
	}

	// 清空单条留言
	public String removeSinWord() {
		List<leaveWorde> words = (List<leaveWorde>) session.get("wordS");

		if (words != null && words.size() >= 1 && lword != null && lword.getLeaveWord_id() != null) {
			try {
				for (leaveWorde leaveW : words) {
					if (leaveW.getLeaveWord_id().equals(lword.getLeaveWord_id())) {
						zzxkyService.remove(leaveW);
						words.remove(leaveW);
					}
				}
				session.put("wordS", words);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}
	}

	// 清除指定多条留言
	public String removeManyWord() {
		List<leaveWorde> removeWords = new ArrayList<leaveWorde>();
		List<leaveWorde> words = (List<leaveWorde>) session.get("wordS");
		String[] stringIndex1 = stringIndex.split(",");

		if (words != null && words.size() >= 1 && stringIndex != null) {
			try {
				// session获取要删除的留言信息对象
				for (int i = 0; i < stringIndex1.length; i++) {
					System.out.println(i + "====" + stringIndex1[i]);
					for (leaveWorde leaveW : words) {
						System.out.println(leaveW.getLeaveWord_id() + "======" + stringIndex1[i]);
						if (leaveW.getLeaveWord_id().equals(Integer.parseInt(stringIndex1[i]))) {
							removeWords.add(leaveW);

						}
					}

				}
				// 遍历删除留言信息
				for (leaveWorde leword : removeWords) {
					zzxkyService.remove(leword);
					words.remove(leword);
				}
				session.put("wordS", words);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}

	}

	// 用户留言模糊查询
	public String findRoundWord() {
		// 从session取出模糊查询的内容
		String word_name = (String) session.get("roundWords");
		if (word_name != null && lword.getLeaveWord_name() == null) {
			lword.setLeaveWord_name(word_name);
		}
		System.out.println(lword.getLeaveWord_id()+"========"+lword.getLeaveWord_name());
		if (lword != null && lword.getLeaveWord_name() != null && lword.getLeaveWord_id() != null) {

			try {
				// 往session更新模糊查询的内容
				if (!lword.getLeaveWord_name().equals(word_name)) {
					session.put("roundWords", lword.getLeaveWord_name());
				}

				List<? extends leaveWorde> words = zzxkyService.findByPage(lword.getClass(),
						"where leaveWord_name like '%" + lword.getLeaveWord_name() + "%'   order by leaveWord_id desc ",
						lword.getLeaveWord_id());
				List<? extends leaveWorde> wordsWhole = zzxkyService.findByWhere(lword.getClass(),
						" leaveWord_name like '%" + lword.getLeaveWord_name() + "%'   order by leaveWord_id desc ");
				session.put("wordsLeave", words);
				session.put("wordS", wordsWhole);
				session.put("lword", lword);
				PrintWriter out = ServletActionContext.getResponse().getWriter();
				out.println(1);
				out.close();
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return "error";
			}

		} else {
			return "error";
		}

	}

	// 添加新闻
	public String addNews() {
		// 新闻添加测试
		news ns = new news();
		ns.setNews_readCount(15);
		Set<String> imgs = new HashSet<String>();
		imgs.add("img/ns.jpg");
		imgs.add("img/ns10.jpg");
		imgs.add("img/ns20.jpg");
		imgs.add("img/ns30.jpg");
		imgs.add("img/ns40.jpg");
		imgs.add("img/ns50.jpg");
		ns.setNews_contentImage(imgs);
		ns.setNews_content("1111");
		ns.setNews_title("新闻测试");
		ns.setNews_titleImage("img/n1.jpg");
		ns.setNews_top(true);
		ns.setNews_updateTime(new Date());
		ns.setNews_video("video/v1.mp4");
		ns.setNews_writer("小明");
		zzxkyService.save(ns);

		// 测试find方法
		// List<news> nes = (List<news>) zzxkyService.findAll(ns.getClass(), ns);
		// for (news news : nes) {
		// Set<String> vc = news.getNews_contentImage();
		// for (String string : vc) {
		// System.out.println("新闻编号：" + news.getNews_id() + ",图片地址为：" + string);
		// }
		// }

		// 测试findByWhere方法成功获取值

		// List<? extends news> ns1 = zzxkyService.findByWhere(ns.getClass(),
		// "news_id="+3);
		// Set<String> vc = ns1.get(0).getNews_contentImage();
		// for (String string : vc) {
		// System.out.println("新闻编号：" + ns1.get(0).getNews_id() + ",图片地址为：" + string);
		// }

		// 测试getByid方法
		news ns1 = zzxkyService.getById(ns.getClass(), 3);
		Set<String> vc = ns1.getNews_contentImage();
		for (String string : vc) {
			System.out.println("新闻编号：" + ns1.getNews_id() + ",图片地址为：" + string);
		}
		return "success";
	}

}
