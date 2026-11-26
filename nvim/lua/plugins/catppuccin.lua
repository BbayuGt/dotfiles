return {
	"ribru17/bamboo.nvim",
	name="bamboo",
	priority=1000,
	config = function()
		require('bamboo').setup {

		}
		require('bamboo').load()
	end
}
