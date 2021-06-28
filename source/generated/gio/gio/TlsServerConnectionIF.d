module gio.TlsServerConnectionIF;

private import gio.IOStream;
private import gio.TlsCertificate;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * #GTlsServerConnection is the server-side subclass of #GTlsConnection,
 * representing a server-side TLS connection.
 *
 * Since: 2.28
 */
public interface TlsServerConnectionIF{
	/** Get the main Gtk struct */
	public GTlsServerConnection* getTlsServerConnectionStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_tls_server_connection_get_type();
	}
}
