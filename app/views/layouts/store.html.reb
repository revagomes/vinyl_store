<html>
  <head>
    <title>No Masters Distro</title>
  </head>
<body>
  Produtos Comprados: <%= @order.order_items.sum(:quantity) %> | 
  Total: <%= @order.total || 0 %> |
  <%= link_to 'Ver meu carrinho', :controller => :cart, :action => :index %>
  <hr />
  <%= yield %>

</body>
</html>