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

//Action��
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

	// ע���û�
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

	// ɾ���û�
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

	// �����û�
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

	// ��ȡ�����û�����
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

	// �û���¼
	public String loginUser() {
		if (user1 != null && user1.getUser_name() != null && user1.getUser_password() != null && session != null) {
			List<? extends user> userInfos = zzxkyService.findAll(user1.getClass(), user1);
			for (user user : userInfos) {
				if (user.getUser_name().equals(user1.getUser_name())
						&& user.getUser_password().equals(user1.getUser_password())) {
					// �������ڸ�ʽ
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					// ����½ʱ������ǰ̨��ҳ��ʾ
					session.put("loginTime", sdf.format(user.getUser_loginTime()));
					user.setUser_loginTime(new Date());
					// �����û���ε�½��ʱ��
					zzxkyService.save(user);
					// ȥ���û�����˽��Ϣ
					user.setUser_password(null);
					// �����û��ĵ�½����
					session.put("userInfo", user);
					session.put("userState", 1);
					return "success";
				}

			}
		}
		if (session != null) {
			session.put("userState", 0);
			addFieldError("loginErr", "��¼ʧ�ܣ���ȷ���û����������Ƿ���ȷ��");
		}

		return "error";
	}

	// �û��˳�
	public String exitUser() {
		// ��ʼ��session�е��û���Ϣ
		if (session != null) {
			session.remove("userInfo");
			session.remove("loginTime");
			session.put("userState", 0);
			return "success";
		} else {
			return "error";
		}

	}

	// �ж��û��Ƿ����ߣ�������߿��Իص���ҳ
	public String judgeLogin() {
		if (session.get("userInfo") != null && session.get("loginTime") != null
				&& (int) session.get("userState") == 1) {
			return "success";

		} else {
			addFieldError("loginErr", "�����û�δ��¼��");
			return "error";
		}
	}

	// ��ѯ���е�������Ϣ
	public String searchMap() {
		map map = new map();
		try {
			List<? extends com.zzxky_edu.beans.map> listMap = zzxkyService.findAll(map.getClass(), map);
			listMap.sort((s1, s2) -> s1.getMap_id().compareTo(s2.getMap_id()));
			for (int i = 0; i < listMap.size(); i++) {
				if (i >= 6) {
					// �Ƴ��Ƿ���������Ϣ
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

	// ��ȡ������������Ϣ
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

	// ɾ����������Ϣ
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

	// ��յ�������Ϣ
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

	// ��ӵ�������Ϣ
	public String addMap() {

		PrintWriter out = null;
		try {
			out = ServletActionContext.getResponse().getWriter();
			System.out.println(map.getMap_content() + "========" + map.getMap_links());
			if (map != null && map.getMap_content() != null && map.getMap_links() != null) {
				// ��ӵ����������ݿ�
				Integer mapNum = ((List) session.get("maps")).size();

				if (mapNum >= 6) {

					out.println("6");
					out.close();
					return "success";
				} else {
					zzxkyService.save(map);
					// ��ӳɹ�������ajax�ɹ���Ϣ
					List<? extends com.zzxky_edu.beans.map> listMap = zzxkyService.findAll(map.getClass(), map);
					listMap.sort((s1, s2) -> s1.getMap_id().compareTo(s2.getMap_id()));
					for (int i = 0; i < listMap.size(); i++) {
						if (i >= 6) {
							// �Ƴ��Ƿ���������Ϣ
							zzxkyService.remove(listMap.get(i));
							listMap.remove(i);

						}
					}
					session.put("maps", listMap);

					out.println("1");
					out.close();
					System.out.println("��ӳɹ�");
					return "success";
				}

			} else {
				System.out.println("mapΪnull");
				return "error";
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.println("9");
			out.close();
			System.out.println("map�����쳣��");

			return "error";
		}
	}

	// �޸ĵ�������Ϣ
	public String updateMap() {
		if (map != null && map.getMap_id() != null && map.getMap_content() != null && map.getMap_links() != null) {
			try {
				zzxkyService.update(map);
				List<? extends com.zzxky_edu.beans.map> listMap = zzxkyService.findAll(map.getClass(), map);
				listMap.sort((s1, s2) -> s1.getMap_id().compareTo(s2.getMap_id()));
				for (int i = 0; i < listMap.size(); i++) {
					if (i >= 6) {
						// �Ƴ��Ƿ���������Ϣ
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

	// ��ѯ����������Ա��Ϣ
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

	// ���Է�ҳЧ��
	public String searchWordByPage() {
		if (lword != null && lword.getLeaveWord_id() != null) {
			// lword.getLeaveWord_id():��Ҫ��ȡ��ҳ����
			List<? extends leaveWorde> wordS = zzxkyService.findByPage(lword.getClass(), "order by leaveWord_id desc",
					lword.getLeaveWord_id());
			session.put("wordPage", wordS);
			return "success";
		} else {
			return "error";
		}
	}

	// ��ѯ��������
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

	// �����������
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

	// ��յ�������
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

	// ���ָ����������
	public String removeManyWord() {
		List<leaveWorde> removeWords = new ArrayList<leaveWorde>();
		List<leaveWorde> words = (List<leaveWorde>) session.get("wordS");
		String[] stringIndex1 = stringIndex.split(",");

		if (words != null && words.size() >= 1 && stringIndex != null) {
			try {
				// session��ȡҪɾ����������Ϣ����
				for (int i = 0; i < stringIndex1.length; i++) {
					System.out.println(i + "====" + stringIndex1[i]);
					for (leaveWorde leaveW : words) {
						System.out.println(leaveW.getLeaveWord_id() + "======" + stringIndex1[i]);
						if (leaveW.getLeaveWord_id().equals(Integer.parseInt(stringIndex1[i]))) {
							removeWords.add(leaveW);

						}
					}

				}
				// ����ɾ��������Ϣ
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

	// �û�����ģ����ѯ
	public String findRoundWord() {
		// ��sessionȡ��ģ����ѯ������
		String word_name = (String) session.get("roundWords");
		if (word_name != null && lword.getLeaveWord_name() == null) {
			lword.setLeaveWord_name(word_name);
		}
		System.out.println(lword.getLeaveWord_id()+"========"+lword.getLeaveWord_name());
		if (lword != null && lword.getLeaveWord_name() != null && lword.getLeaveWord_id() != null) {

			try {
				// ��session����ģ����ѯ������
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

	// �������
	public String addNews() {
		// ������Ӳ���
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
		ns.setNews_title("���Ų���");
		ns.setNews_titleImage("img/n1.jpg");
		ns.setNews_top(true);
		ns.setNews_updateTime(new Date());
		ns.setNews_video("video/v1.mp4");
		ns.setNews_writer("С��");
		zzxkyService.save(ns);

		// ����find����
		// List<news> nes = (List<news>) zzxkyService.findAll(ns.getClass(), ns);
		// for (news news : nes) {
		// Set<String> vc = news.getNews_contentImage();
		// for (String string : vc) {
		// System.out.println("���ű�ţ�" + news.getNews_id() + ",ͼƬ��ַΪ��" + string);
		// }
		// }

		// ����findByWhere�����ɹ���ȡֵ

		// List<? extends news> ns1 = zzxkyService.findByWhere(ns.getClass(),
		// "news_id="+3);
		// Set<String> vc = ns1.get(0).getNews_contentImage();
		// for (String string : vc) {
		// System.out.println("���ű�ţ�" + ns1.get(0).getNews_id() + ",ͼƬ��ַΪ��" + string);
		// }

		// ����getByid����
		news ns1 = zzxkyService.getById(ns.getClass(), 3);
		Set<String> vc = ns1.getNews_contentImage();
		for (String string : vc) {
			System.out.println("���ű�ţ�" + ns1.getNews_id() + ",ͼƬ��ַΪ��" + string);
		}
		return "success";
	}

}
