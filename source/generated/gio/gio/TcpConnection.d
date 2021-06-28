module gio.TcpConnection;

private import gio.SocketConnection;
private import gio.c.functions;
public  import gio.c.types;


/**
 * This is the subclass of #GSocketConnection that is created
 * for TCP/IP sockets.
 *
 * Since: 2.22
 */
public class TcpConnection : SocketConnection
{
	/** the main Gtk struct */
	protected GTcpConnection* gTcpConnection;

	/** Get the main Gtk struct */
	public GTcpConnection* getTcpConnectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gTcpConnection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gTcpConnection;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTcpConnection* gTcpConnection, bool ownedRef = false)
	{
		this.gTcpConnection = gTcpConnection;
		super(cast(GSocketConnection*)gTcpConnection, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_tcp_connection_get_type();
	}

	/**
	 * Checks if graceful disconnects are used. See
	 * g_tcp_connection_set_graceful_disconnect().
	 *
	 * Returns: %TRUE if graceful disconnect is used on close, %FALSE otherwise
	 *
	 * Since: 2.22
	 */
	public bool getGracefulDisconnect()
	{
		return g_tcp_connection_get_graceful_disconnect(gTcpConnection) != 0;
	}

	/**
	 * This enables graceful disconnects on close. A graceful disconnect
	 * means that we signal the receiving end that the connection is terminated
	 * and wait for it to close the connection before closing the connection.
	 *
	 * A graceful disconnect means that we can be sure that we successfully sent
	 * all the outstanding data to the other end, or get an error reported.
	 * However, it also means we have to wait for all the data to reach the
	 * other side and for it to acknowledge this by closing the socket, which may
	 * take a while. For this reason it is disabled by default.
	 *
	 * Params:
	 *     gracefulDisconnect = Whether to do graceful disconnects or not
	 *
	 * Since: 2.22
	 */
	public void setGracefulDisconnect(bool gracefulDisconnect)
	{
		g_tcp_connection_set_graceful_disconnect(gTcpConnection, gracefulDisconnect);
	}
}
