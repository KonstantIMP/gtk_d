module gio.DtlsServerConnectionT;

public  import gio.DatagramBasedIF;
public  import gio.TlsCertificate;
public  import gio.c.functions;
public  import gio.c.types;
public  import glib.ConstructionException;
public  import glib.ErrorG;
public  import glib.GException;
public  import gobject.ObjectG;


/**
 * #GDtlsServerConnection is the server-side subclass of #GDtlsConnection,
 * representing a server-side DTLS connection.
 *
 * Since: 2.48
 */
public template DtlsServerConnectionT(TStruct)
{
	/** Get the main Gtk struct */
	public GDtlsServerConnection* getDtlsServerConnectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GDtlsServerConnection*)getStruct();
	}

}
