module gio.DtlsServerConnectionIF;

private import gio.DatagramBasedIF;
private import gio.TlsCertificate;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;


/**
 * #GDtlsServerConnection is the server-side subclass of #GDtlsConnection,
 * representing a server-side DTLS connection.
 *
 * Since: 2.48
 */
public interface DtlsServerConnectionIF{
	/** Get the main Gtk struct */
	public GDtlsServerConnection* getDtlsServerConnectionStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_dtls_server_connection_get_type();
	}
}
