#
#  string_patch.rb
#  
#
#  Created by Renato Vasconcellos Gomes on 6/18/10.
#  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
#

class String
  def same_char?
    split(//).uniq.size == 1
  end

  def sequence?
	self == (self.first..self.last).to_a.to_s
  end
end
