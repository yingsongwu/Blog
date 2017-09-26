package com.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blog.pojo.Blog;
import com.blog.pojo.BlogAndUser;
import com.blog.pojo.CommentVo;
import com.blog.pojo.User;
import com.blog.service.BlogService;
import com.blog.service.CommentService;
import com.blog.service.ShowBlogService;

@Controller
@RequestMapping("/BlogController")
public class BlogController {

	private static final Logger LOG = Logger.getLogger(BlogController.class);

	@Resource
	private ShowBlogService showBlogService;

	@Resource
	private CommentService commentService;

	@RequestMapping(value = "/ShowBlogText.action")
	// 博客展示界面
	public ModelAndView ShowBlogText(int b_id, HttpServletRequest request) {
		BlogAndUser blog = showBlogService.findByTitle(b_id);

		request.setAttribute("blog", blog);
		ModelAndView modelAndView = new ModelAndView();
		ArrayList<CommentVo> comments = null;
		try {
			comments = commentService.getAllCommentsByBid(b_id);
			// 模拟b_id，user 做测试用
			modelAndView.addObject("b_id", b_id);
			User testUser = new User();
			testUser.setU_id(1);
			modelAndView.addObject("user", testUser);
			modelAndView.addObject("comments", comments);
			modelAndView.setViewName("blogtext");
		} catch (Exception e) {
			LOG.info("BlogController.showComment(b_id) e:" + e);
			e.printStackTrace();
		}
		return modelAndView;
	}

	@Resource
	private BlogService blogService;

	@RequestMapping("/blogWrite.action")
	public String blogWrite() {
		return "blogWrite";
	}

	@RequestMapping("/addBlog.action")
	@ResponseBody
	public int saveBlog(HttpSession session, @RequestBody Blog blog) {
		int result = 0;
		User user = (User) session.getAttribute("user");
		blog.setU_id(user.getU_id());
		try {
			result = blogService.saveBlog(blog);
		} catch (Exception e) {
			LOG.info("BlogController.saveBlog e:" + e);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/saveBlog.action")
	@ResponseBody
	public int addBlog(HttpSession session, @RequestBody Blog blog) {
		int result = 0;
		User user = (User) session.getAttribute("user");
		blog.setU_id(user.getU_id());
		try {
			result = blogService.addBlog(blog);
		} catch (Exception e) {
			LOG.info("BlogController.addBlog e:" + e);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/delBlogById.action")
	@ResponseBody
	public int delBlogById(@RequestBody Map id) {
		int result = 0;
		try {
			result = blogService.delBlogById((int) id.get("b_id"));
		} catch (Exception e) {
			LOG.info("BlogController.delBlogById e:" + e);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/findBlogById.action")
	public String findBlogById(@RequestParam int b_id, HttpServletRequest request) {
		BlogAndUser blog = null;
		ArrayList<CommentVo> comments = null;
		try {
			blog = showBlogService.findByTitle(b_id);
			request.setAttribute("blog", blog);

			comments = commentService.getAllCommentsByBid(b_id);
			request.setAttribute("b_id", b_id);
			request.setAttribute("comments", comments);
		} catch (Exception e) {
			LOG.info("BlogController.findBlogById e:" + e);
			e.printStackTrace();
		}
		return "blogtext";
	}

	@RequestMapping(value = "/ShowBlog")
	// 开始界面
	public String ShowBlog(HttpServletRequest request) {
		int page = 1;
		Map<String, Object> map = showBlogService.findAllByPage(page);

		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		return "index";

	}

	@RequestMapping(value = "/ShowBlogBypage")
	// 分页界面
	public String ShowBlogByPage(int page, HttpServletRequest request) {
		Map<String, Object> map = showBlogService.findAllByPage(page);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		return "index";

	}

	@RequestMapping(value = "/ShowBlogByUser")
	// 根据作者查询
	public String ShowBlogByUser(String u_name, int page, HttpServletRequest request) {
		Map<String, Object> map = showBlogService.findByName(u_name, page);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));
		request.setAttribute("name", u_name);
		return "user";
	}

	@RequestMapping(value = "/ShowBlogByType")
	// 根据类型查询
	public String ShowBlogByType(String t_name, int page, HttpServletRequest request) {
		Map<String, Object> map = showBlogService.findByType(t_name, page);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));
		request.setAttribute("t_name", t_name);

		return "type";
	}

	@RequestMapping(value = "/ShowBlog1")

	public String ShowBlog1(HttpServletRequest request) {
		List<BlogAndUser> list = (List<BlogAndUser>) showBlogService.findAll();
		request.setAttribute("list", list);
		return "index";
	}

	@RequestMapping(value = "/ShowBlogReadNum")
	// 根据阅读量查询
	public String ShowBlog2(HttpServletRequest request) {
		List<BlogAndUser> list = showBlogService.findByReadNum();
		request.setAttribute("list", list);
		return "index";
	}

	@RequestMapping(value = "/ShowBlogNum")
	// 根据评论量查询
	public String ShowBlog3(HttpServletRequest request) {
		List<BlogAndUser> list = showBlogService.findByNum();
		request.setAttribute("list", list);
		return "index";
	}

	@RequestMapping(value = "/ShowBlogSearch")
	// 根据搜索查询（输入类型或作者）
	public String ShowBlogSearch(String s, HttpServletRequest request) {
		int page = 1;
		Map<String, Object> map = showBlogService.findAllSearch(s, page);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));
		request.setAttribute("s", s);
		return "Search";
	}

	@RequestMapping(value = "/ShowBlogSearch1")
	// 搜索的分页
	public String ShowBlogSearch1(String s, int page, HttpServletRequest request) {
		Map<String, Object> map = showBlogService.findAllSearch(s, page);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));
		request.setAttribute("s", s);
		return "Search";
	}

	// 博客展示界面
	@RequestMapping(value = "/ShowBlogText1")
	public String ShowBlogText1(int b_id, HttpServletRequest request) {
		BlogAndUser blog = showBlogService.findByTitle(b_id);
		request.setAttribute("blog", blog);

		ArrayList<CommentVo> comments = null;
		try {
			comments = commentService.getAllCommentsByBid(b_id);
			// TODO
			request.getSession().setAttribute("b_id", b_id);
			request.setAttribute("comments", comments);

			// 博客评论数量
			int commentsNum = 0;
			commentsNum += comments.size();
			for (CommentVo commentVo : comments) {
				commentsNum += commentVo.getSubCommentVo().size();
			}
			request.setAttribute("commentsNum", commentsNum);
		} catch (Exception e) {
			LOG.info("BlogController.ShowBlogText1 e: " + e);
		}

		return "blogtext";
	}

	// 我的博客 界面
	@RequestMapping("/MyBlog.action")
	public String MyBlog() {
		return "redirect:/blogList.action";
	}

	@RequestMapping("/blogEdit.action")
	public String editBlogById(int b_id, HttpServletRequest request) {
		Blog blog = null;
		try {
			blog = blogService.findBlogById(b_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("blog", blog);
		return "blogEdit";
	}

	@RequestMapping(value = "/blogList.action")
	// 开始界面
	public String blogList(HttpServletRequest request, HttpSession session) {
		int page = 1;
		User tempUser = (User) session.getAttribute("user");
		int u_id = tempUser.getU_id();
		Map<String, Object> map = showBlogService.findBlogListByPage(page, u_id);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		// return "index";
		return "blogList";

	}

	@RequestMapping(value = "/blogListBypage.action")
	// 分页界面
	public String blogListByPage(int page, HttpServletRequest request, HttpSession session) {
		User tempUser = (User) session.getAttribute("user");
		int u_id = tempUser.getU_id();
		Map<String, Object> map = showBlogService.findBlogListByPage(page, u_id);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		// return "index";
		return "blogList";
	}

	@RequestMapping(value = "/blogDraft.action")
	// 开始界面
	public String blogDraft(HttpServletRequest request, HttpSession session) {
		int page = 1;
		User tempUser = (User) session.getAttribute("user");
		int u_id = tempUser.getU_id();
		Map<String, Object> map = showBlogService.findBlogDraftByPage(page, u_id);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		// return "index";
		return "blogList";

	}

	@RequestMapping(value = "/blogDraftBypage.action")
	// 分页界面
	public String blogDraftByPage(int page, HttpServletRequest request, HttpSession session) {
		User tempUser = (User) session.getAttribute("user");
		int u_id = tempUser.getU_id();
		Map<String, Object> map = showBlogService.findBlogDraftByPage(page, u_id);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		// return "index";
		return "blogList";
	}

	@RequestMapping(value = "/blogDeleted.action")
	// 开始界面
	public String blogDelete(HttpServletRequest request, HttpSession session) {
		int page = 1;
		User tempUser = (User) session.getAttribute("user");
		int u_id = tempUser.getU_id();
		Map<String, Object> map = showBlogService.findBlogDeleteByPage(page, u_id);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		// return "index";
		return "blogList";

	}

	@RequestMapping(value = "/blogDeletedByPage.action")
	// 分页界面
	public String blogDeleteByPage(int page, HttpServletRequest request, HttpSession session) {
		User tempUser = (User) session.getAttribute("user");
		int u_id = tempUser.getU_id();
		Map<String, Object> map = showBlogService.findBlogDeleteByPage(page, u_id);
		request.setAttribute("list", map.get("list"));
		request.setAttribute("pageCount", map.get("pageCount"));

		// return "index";
		return "blogList";
	}

	/**
	 * 更新评论数量
	 */
	@RequestMapping("updateBlogCommentsNum.action")
	@ResponseBody
	public Map<String, Integer> updateBlogCommentsNum(@RequestBody Blog blog) {
		Map<String, Integer> map = new HashMap<>();
		int result = 0;
		try {
			result = blogService.updateBlogCommentsNum(blog);
		} catch (Exception e) {
			LOG.info("BlogController.updateBlogCommentsNum(int b_id,int num) e:" + e);
		}

		map.put("result", result);
		return map;
	}
	
	@RequestMapping("/updateBlog.action")
	@ResponseBody
	public int updateBlog(@RequestBody Blog blog){
		int result = 0;
		try {
			result = blogService.updateBlog(blog);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
