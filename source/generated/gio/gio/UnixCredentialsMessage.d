module gio.UnixCredentialsMessage;

private import gio.Credentials;
private import gio.SocketControlMessage;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * This #GSocketControlMessage contains a #GCredentials instance.  It
 * may be sent using g_socket_send_message() and received using
 * g_socket_receive_message() over UNIX sockets (ie: sockets in the
 * %G_SOCKET_FAMILY_UNIX family).
 * 
 * For an easier way to send and receive credentials over
 * stream-oriented UNIX sockets, see
 * g_unix_connection_send_credentials() and
 * g_unix_connection_receive_credentials(). To receive credentials of
 * a foreign process connected to a socket, use
 * g_socket_get_credentials().
 *
 * Since: 2.26
 */
public class UnixCredentialsMessage : SocketControlMessage
{
	/** the main Gtk struct */
	protected GUnixCredentialsMessage* gUnixCredentialsMessage;

	/** Get the main Gtk struct */
	public GUnixCredentialsMessage* getUnixCredentialsMessageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gUnixCredentialsMessage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gUnixCredentialsMessage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GUnixCredentialsMessage* gUnixCredentialsMessage, bool ownedRef = false)
	{
		this.gUnixCredentialsMessage = gUnixCredentialsMessage;
		super(cast(GSocketControlMessage*)gUnixCredentialsMessage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_unix_credentials_message_get_type();
	}

	/**
	 * Creates a new #GUnixCredentialsMessage with credentials matching the current processes.
	 *
	 * Returns: a new #GUnixCredentialsMessage
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = g_unix_credentials_message_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GUnixCredentialsMessage*) __p, true);
	}

	/**
	 * Creates a new #GUnixCredentialsMessage holding @credentials.
	 *
	 * Params:
	 *     credentials = A #GCredentials object.
	 *
	 * Returns: a new #GUnixCredentialsMessage
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Credentials credentials)
	{
		auto __p = g_unix_credentials_message_new_with_credentials((credentials is null) ? null : credentials.getCredentialsStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_with_credentials");
		}

		this(cast(GUnixCredentialsMessage*) __p, true);
	}

	/**
	 * Checks if passing #GCredentials on a #GSocket is supported on this platform.
	 *
	 * Returns: %TRUE if supported, %FALSE otherwise
	 *
	 * Since: 2.26
	 */
	public static bool isSupported()
	{
		return g_unix_credentials_message_is_supported() != 0;
	}

	/**
	 * Gets the credentials stored in @message.
	 *
	 * Returns: A #GCredentials instance. Do not free, it is owned by @message.
	 *
	 * Since: 2.26
	 */
	public Credentials getCredentials()
	{
		auto __p = g_unix_credentials_message_get_credentials(gUnixCredentialsMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Credentials)(cast(GCredentials*) __p);
	}
}
