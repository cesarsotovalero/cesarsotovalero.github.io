# Auto-generate blog stats data file
# Writes _data/blog-stats.json with the count of published posts
require 'json'
require 'fileutils'

Jekyll::Hooks.register :site, :post_read do |site|
  # Select posts with published: true in front matter
  published = site.posts.docs.select { |p| p.data['published'] == true }
  stats = { 'published_posts' => published.size }
  # Ensure _data directory exists
  data_dir = File.join(site.source, '_data')
  FileUtils.mkdir_p(data_dir) unless Dir.exist?(data_dir)
  File.write(
    File.join(data_dir, 'blog_stats.json'),
    JSON.pretty_generate(stats)
  )
  Jekyll.logger.info "blog_count:", "Wrote #{stats['published_posts']} published_posts to _data/blog-stats.json"
end
