<html>
  <head>
    <title>No Masters Distro</title>
  </head>
<body>
  Produtos Comprados: 
		<span id="cart-quantity"><%= @order.order_items.sum(:quantity) %></span> | 
  Total: <span id="cart-total"><%= @order.total || 0 %></span> |
  <%= link_to 'Ver meu carrinho', :controller => :cart, :action => :index %>
  <hr />
  <%= yield %>

</body>
</html>