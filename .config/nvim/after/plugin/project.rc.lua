local status, project = pcall(require, "project_nvim")
if (not status) then return end

 require("project_nvim").setup {}



local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('projects')
