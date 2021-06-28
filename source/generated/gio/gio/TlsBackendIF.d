module gio.TlsBackendIF;

private import gio.TlsBackendIF;
private import gio.TlsDatabase;
private import gio.c.functions;
public  import gio.c.types;
private import gobject.ObjectG;


/**
 * TLS (Transport Layer Security, aka SSL) and DTLS backend.
 *
 * Since: 2.28
 */
public interface TlsBackendIF{
	/** Get the main Gtk struct */
	public GTlsBackend* getTlsBackendStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_tls_backend_get_type();
	}

	/**
	 * Gets the default #GTlsBackend for the system.
	 *
	 * Returns: a #GTlsBackend, which will be a
	 *     dummy object if no TLS backend is available
	 *
	 * Since: 2.28
	 */
	public static TlsBackendIF getDefault()
	{
		auto __p = g_tls_backend_get_default();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsBackendIF)(cast(GTlsBackend*) __p);
	}

	/**
	 * Gets the #GType of @backend's #GTlsCertificate implementation.
	 *
	 * Returns: the #GType of @backend's #GTlsCertificate
	 *     implementation.
	 *
	 * Since: 2.28
	 */
	public GType getCertificateType();

	/**
	 * Gets the #GType of @backend's #GTlsClientConnection implementation.
	 *
	 * Returns: the #GType of @backend's #GTlsClientConnection
	 *     implementation.
	 *
	 * Since: 2.28
	 */
	public GType getClientConnectionType();

	/**
	 * Gets the default #GTlsDatabase used to verify TLS connections.
	 *
	 * Returns: the default database, which should be
	 *     unreffed when done.
	 *
	 * Since: 2.30
	 */
	public TlsDatabase getDefaultDatabase();

	/**
	 * Gets the #GType of @backend’s #GDtlsClientConnection implementation.
	 *
	 * Returns: the #GType of @backend’s #GDtlsClientConnection
	 *     implementation, or %G_TYPE_INVALID if this backend doesn’t support DTLS.
	 *
	 * Since: 2.48
	 */
	public GType getDtlsClientConnectionType();

	/**
	 * Gets the #GType of @backend’s #GDtlsServerConnection implementation.
	 *
	 * Returns: the #GType of @backend’s #GDtlsServerConnection
	 *     implementation, or %G_TYPE_INVALID if this backend doesn’t support DTLS.
	 *
	 * Since: 2.48
	 */
	public GType getDtlsServerConnectionType();

	/**
	 * Gets the #GType of @backend's #GTlsFileDatabase implementation.
	 *
	 * Returns: the #GType of backend's #GTlsFileDatabase implementation.
	 *
	 * Since: 2.30
	 */
	public GType getFileDatabaseType();

	/**
	 * Gets the #GType of @backend's #GTlsServerConnection implementation.
	 *
	 * Returns: the #GType of @backend's #GTlsServerConnection
	 *     implementation.
	 *
	 * Since: 2.28
	 */
	public GType getServerConnectionType();

	/**
	 * Set the default #GTlsDatabase used to verify TLS connections
	 *
	 * Any subsequent call to g_tls_backend_get_default_database() will return
	 * the database set in this call.  Existing databases and connections are not
	 * modified.
	 *
	 * Setting a %NULL default database will reset to using the system default
	 * database as if g_tls_backend_set_default_database() had never been called.
	 *
	 * Params:
	 *     database = the #GTlsDatabase
	 *
	 * Since: 2.60
	 */
	public void setDefaultDatabase(TlsDatabase database);

	/**
	 * Checks if DTLS is supported. DTLS support may not be available even if TLS
	 * support is available, and vice-versa.
	 *
	 * Returns: whether DTLS is supported
	 *
	 * Since: 2.48
	 */
	public bool supportsDtls();

	/**
	 * Checks if TLS is supported; if this returns %FALSE for the default
	 * #GTlsBackend, it means no "real" TLS backend is available.
	 *
	 * Returns: whether or not TLS is supported
	 *
	 * Since: 2.28
	 */
	public bool supportsTls();
}
