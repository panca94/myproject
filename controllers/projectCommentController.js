const db = require('../models');

const projectCommentController = {
  // List comments for a project
  async listComments(req, res) {
    try {
      const { id } = req.params;
      
      const project = await db.Project.findByPk(id, {
        include: [
          { model: db.ProjectComment, as: 'comments', include: [{ model: db.User, as: 'author' }], order: [['createdAt', 'DESC']] },
          { model: db.Customer, as: 'customer' },
          { model: db.User, as: 'accountManager' }
        ]
      });

      if (!project) {
        return res.status(404).send('Project tidak ditemukan');
      }

      res.render('projects/details', { project, user: req.session.user, session: req.session });
    } catch (err) {
      res.status(500).send(err.message);
    }
  },

  // Add new comment
  async addComment(req, res) {
    try {
      const { projectId } = req.params;
      const { comment } = req.body;
      const userId = req.session.user.id;

      if (!comment.trim()) {
        return res.status(400).send('Komentar tidak boleh kosong');
      }

      await db.ProjectComment.create({
        comment,
        projectId,
        userId
      });

      res.redirect(`/projects/details/${projectId}`);
    } catch (err) {
      res.status(500).send(err.message);
    }
  },

  // Delete comment
  async deleteComment(req, res) {
    try {
      const { commentId, projectId } = req.params;
      const userId = req.session.user.id;

      const comment = await db.ProjectComment.findByPk(commentId);
      
      if (!comment) {
        return res.status(404).send('Komentar tidak ditemukan');
      }

      // Hanya pembuat comment atau admin yang bisa hapus
      if (comment.userId !== userId && req.session.user.role !== 'admin') {
        return res.status(403).send('Anda tidak berhak menghapus komentar ini');
      }

      await comment.destroy();
      res.redirect(`/projects/details/${projectId}`);
    } catch (err) {
      res.status(500).send(err.message);
    }
  }
};

module.exports = projectCommentController;
