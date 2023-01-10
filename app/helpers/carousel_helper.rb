# app/helpers/carousel_helper.rb

module CarouselHelper
  def carousel_for(images, links)
    Carousel.new(self, images, links).html
  end

  class Carousel
    def initialize(view, images, links)
      @view, @images, @links = view, images, links
      @uid = SecureRandom.hex(6)
    end

    def html
      content = safe_join([indicators, slides, controls])
      
      content_tag(:div, content, id: uid, class: 'carousel slide', 'data-ride' => "carousel")
    end

    private

    attr_accessor :view, :images, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = images.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: { 
          target: uid, 
          slide_to: index
        }
      }

      content_tag(:li, '', options)
    end

    def slides
      items = images.zip(@links).map.with_index { |(image, link), index| slide_tag(image, link, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(image, link, is_active)
      options = {
        class: (is_active ? 'carousel-item active' : 'carousel-item'),
          
      }

      content_tag(:div, link_to(image_tag(image, class: "d-block w-100 resize-carousel"), link), options)
    end

    def controls
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, '', class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end