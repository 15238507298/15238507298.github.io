package com.zzxky_edu.action;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zzxky_edu.beans.FileUpload;
import com.zzxky_edu.beans.lessonType;
import com.zzxky_edu.beans.lessons;
import com.zzxky_edu.service.zzxkyService;

public class zzxkyLessonsTypeAction extends ActionSupport {
	private zzxkyService zzxkyService;
	private lessons lessons;
	private lessonType lessonTypes;
	private Map<String, Object> session = ServletActionContext.getContext().getSession();
	private FileUpload files1;

	public FileUpload getFiles1() {
		return files1;
	}

	public void setFiles1(FileUpload files1) {
		this.files1 = files1;
	}

	public zzxkyService getZzxkyService() {
		return zzxkyService;
	}

	public void setZzxkyService(zzxkyService zzxkyService) {

		this.zzxkyService = zzxkyService;
	}

	public lessons getLessons() {
		return lessons;
	}

	public void setLessons(lessons lessons) {
		this.lessons = lessons;
	}

	public lessonType getLessonTypes() {
		return lessonTypes;
	}

	public void setLessonTypes(lessonType lessonTypes) {
		this.lessonTypes = lessonTypes;
	}

	// �γ����ͷ�ҳЧ��
	public String searchLYPage() {
		System.out.println(lessonTypes.getLessonType_id());
		if (lessonTypes != null && lessonTypes.getLessonType_id() != null) {
			try {
				// ��ѯ���пγ�����
				List<lessonType> lessonTypesS = (List<lessonType>) zzxkyService.findAll(lessonTypes.getClass(),
						lessonTypes);
				session.put("lessonTypesS", lessonTypesS);
				// ��ҳЧ��
				List<lessonType> lessonTypesSPage = (List<lessonType>) zzxkyService.findByPage(lessonTypes.getClass(),
						"order by LessonType_id desc", lessonTypes.getLessonType_id());
				session.put("lessonTyps", lessonTypesSPage);

				for (lessonType lessonType : lessonTypesSPage) {
					System.out.println(lessonType.getLessonType_name() + "====" + lessonType.getLessonType_id());
				}
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}
		}
		return "error";
	}

	// ajax��ӿγ�����
	public String addLessonType() {
		if (lessonTypes != null && lessonTypes.getLessonType_name() != null) {
			try {
				// ��ӿγ����͵����ݿ�
				zzxkyService.save(lessonTypes);
				// ��ѯ���пγ�����
				List<lessonType> lessonTypesS = (List<lessonType>) zzxkyService.findAll(lessonTypes.getClass(),
						lessonTypes);
				session.put("lessonTypesS", lessonTypesS);
				// ��ҳЧ��
				List<lessonType> lessonTypesSPage = (List<lessonType>) zzxkyService.findByPage(lessonTypes.getClass(),
						"order by LessonType_id desc", lessonTypes.getLessonType_id());
				session.put("lessonTyps", lessonTypesSPage);
				// ����ajax��Ϣ��ӳɹ�
				PrintWriter out = ServletActionContext.getResponse().getWriter();
				out.println(1);
				out.close();
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}

		} else {
			return "error";
		}
	}

	// ɾ���γ�����
	public String deleteLessonType() {
		// List<lessonType> lessonTypesS=(List<lessonType>)session.get("lessonTypesS");
		List<lessonType> lessonTypesSPage = (List<lessonType>) session.get("lessonTyps");
		if (lessonTypes != null && lessonTypes.getLessonType_id() != null && lessonTypesSPage.size() >= 1) {
			try {

				for (lessonType lessonType : lessonTypesSPage) {

					if (lessonType.getLessonType_id().equals(lessonTypes.getLessonType_id())) {
						// �����ݿ�ɾ���ÿγ�����
						zzxkyService.remove(lessonType);
						// ��session����ɾ���ÿγ�����
						// lessonTypesSPage.remove(lessonType);
						// lessonTypesS.remove(lessonType);

					}
				}
				// ���޸ĵ����ݱ��浽session��
				// session.put("lessonTyps", lessonTypesSPage);
				// session.put("lessonTypesS", lessonTypesS);
				return "success";
			} catch (Exception e) {
				// TODO: handle exception
				return "error";
			}
		} else {
			return "error";
		}

	}

	// ģ�������γ�����
	public String roundFindLessonType() {
		// ��sessionȡ��ģ����ѯ������
		String word_name = (String) session.get("roundLessonTypes");
		System.out.println(lessonTypes.getLessonType_id() + "========" + word_name);
		if (word_name != null && lessonTypes.getLessonType_name() == null) {
			lessonTypes.setLessonType_name(word_name);
		}
		System.out.println(lessonTypes.getLessonType_id() + "========" + lessonTypes.getLessonType_name());
		if (lessonTypes != null && lessonTypes.getLessonType_name() != null && lessonTypes.getLessonType_id() != null) {

			try {
				// ��session����ģ����ѯ������
				if (!lessonTypes.getLessonType_name().equals(word_name)) {
					session.put("roundLessonTypes", lessonTypes.getLessonType_name());
				}
				// ģ����ҳ
				List<? extends lessonType> words = zzxkyService
						.findByPage(
								lessonTypes.getClass(), "where lessonType_name like '%"
										+ lessonTypes.getLessonType_name() + "%'   order by lessonType_id desc ",
								lessonTypes.getLessonType_id());
				// ģ����ѯ����
				List<? extends lessonType> wordsWhole = zzxkyService.findByWhere(lessonTypes.getClass(),
						" lessonType_name like '%" + lessonTypes.getLessonType_name()
								+ "%'   order by lessonType_id desc ");
				session.put("roundLessonTypePage", words);
				session.put("roundLessonTypeS", wordsWhole);
				session.put("lessonTypes", lessonTypes);
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

	// ���ݿγ�������ʾ�γ�

	public String findLessons() {
		Integer lessionTid = (Integer) session.get("typeLessionId");
		if (lessionTid != null && lessonTypes.getLessonType_id() == null) {
			lessonTypes.setLessonType_id(lessionTid);
		}
		System.out.println(lessonTypes.getLessonType_id() + "=============" + lessons.getLessons_id());
		if (lessons != null && lessonTypes != null && lessonTypes.getLessonType_id() != null
				&& lessons.getLessons_id() != null) {
			try {

				if (lessionTid != null && !lessionTid.equals(lessonTypes.getLessonType_id())) {
					session.put("typeLessionId", lessonTypes.getLessonType_id());
				}
				//��ѯ���пγ�
				List<? extends com.zzxky_edu.beans.lessons> lessonss1 = zzxkyService.findByWhere(lessons.getClass(),
						"lessontype=" + lessonTypes.getLessonType_id() + "  order by lessons_id desc");
				session.put("sessionWhole", lessonss1);
				System.out.println(lessonss1.size());
				//��ѯ��ҳ�γ�
				List<? extends com.zzxky_edu.beans.lessons> pageLesson = zzxkyService.findByPage(lessons.getClass(),
						" where  lessontype= " + lessonTypes.getLessonType_id() + "  order by lessons_id desc",
						lessons.getLessons_id());
				session.put("pageLesson", pageLesson);
				System.out.println(pageLesson.size());

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

	// ��ӿγ�֮ǰ��ѯ�γ�����
	public String searchLessonsBefore() {
		try {
			// ��ѯ���пγ�����
			lessonTypes = new lessonType();
			List<lessonType> lessonTypesS = (List<lessonType>) zzxkyService.findAll(lessonTypes.getClass(),
					lessonTypes);
			session.put("lessonTypesS", lessonTypesS);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}
	}

	// �����γ���Ƶ
	public String addLesson() {

		if (lessons != null && files1 != null) {
			try {

				lessons.setLessons_updateTime(new Date());
				lessons.setLessons_concerns(0);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				// ��õ�ǰ·��
				String imgPath = ServletActionContext.getServletContext().getRealPath("upload/image");
				System.out.println(imgPath);
				File files;
				// ���ͼƬ(�ļ������֣�����)
				File file = files1.getImage().get(0);
				String filename = files1.getImageFileName().get(0);
				String filetype = files1.getImageContentType().get(0);
				System.out.println(" image/jpeg ".contains(filetype));
				//����γ�ͼƬ
				if (" image/jpeg ".contains(filetype)) {
					String path=sdf.format(new Date()) + filename;
					files = new File(imgPath+"\\" +path);
						FileUtils.copyFile(file, files);
						lessons.setLessons_image("upload/image/"+path);
				}
//				System.out.println(filename + "======" + filetype);
				//����γ���Ƶ
				// �����Ƶ(�ļ������֣�����)
				String videoPath = ServletActionContext.getServletContext().getRealPath("upload/video");
				file = files1.getVideo().get(0);
				filename = files1.getVideoFileName().get(0);
				filetype = files1.getVideoContentType().get(0);
				//������Ƶ
			    if(filename.contains(".mp4")||filename.contains(".avi") || filename.contains(".rmvb") ) {
			    	String path=sdf.format(new Date())+filename;
			    	files=new File(videoPath+"\\"+path);
			    	FileUtils.copyFile(file, files);
			    	lessons.setLessons_video("upload/video/"+path);
			    }
			    zzxkyService.save(lessons);
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
//ɾ�����ڿγ�
	public String removeSinleson() {
		List<lessons> wholeLesson = (List<com.zzxky_edu.beans.lessons>) session.get("sessionWhole");
		List<lessons> pageLesson= (List<com.zzxky_edu.beans.lessons>) session.get("pageLesson");
		if(lessons!=null && lessons.getLessons_id()!=null && wholeLesson!=null && pageLesson!=null) {
			
			try {
				String path=ServletActionContext.getServletContext().getRealPath("/");
				for (lessons lesson : pageLesson) {
					if(lesson.getLessons_id().equals(lessons.getLessons_id())) {
						new File(path+"//"+lesson.getLessons_image()).delete();
						new File(path+"//"+lesson.getLessons_video()).delete();
						zzxkyService.remove(lesson);
						wholeLesson.remove(lesson);
						pageLesson.remove(lesson);
						break;
					}
				}
				return "success";
			}
			catch (Exception e) {
				// TODO: handle exception
				return "error";
			}
		}
		else {
			return "error";
		}
	}
	
	
}
