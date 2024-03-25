PGDMP                         |            snakers_store_bd    15.6    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    snakers_store_bd    DATABASE     �   CREATE DATABASE snakers_store_bd WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
     DROP DATABASE snakers_store_bd;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16419    clients    TABLE     �   CREATE TABLE public.clients (
    id_client bigint NOT NULL,
    name text,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.clients;
       public         heap    postgres    false    4            �            1259    16418    clients_id_client_seq    SEQUENCE     ~   CREATE SEQUENCE public.clients_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_id_client_seq;
       public          postgres    false    4    221                       0    0    clients_id_client_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_id_client_seq OWNED BY public.clients.id_client;
          public          postgres    false    220            �            1259    16407    marks    TABLE     �   CREATE TABLE public.marks (
    id_mark bigint NOT NULL,
    name text,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.marks;
       public         heap    postgres    false    4            �            1259    16414    marks_clients_prices    TABLE       CREATE TABLE public.marks_clients_prices (
    id_cmp bigint NOT NULL,
    id_client bigint,
    id_mark bigint,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    deleted_at timestamp without time zone,
    descuento real
);
 (   DROP TABLE public.marks_clients_prices;
       public         heap    postgres    false    4            �            1259    16413    marks_clients_prices_id_cmp_seq    SEQUENCE     �   CREATE SEQUENCE public.marks_clients_prices_id_cmp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.marks_clients_prices_id_cmp_seq;
       public          postgres    false    4    219                       0    0    marks_clients_prices_id_cmp_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.marks_clients_prices_id_cmp_seq OWNED BY public.marks_clients_prices.id_cmp;
          public          postgres    false    218            �            1259    16406    marks_id_mark_seq    SEQUENCE     z   CREATE SEQUENCE public.marks_id_mark_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.marks_id_mark_seq;
       public          postgres    false    217    4                       0    0    marks_id_mark_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.marks_id_mark_seq OWNED BY public.marks.id_mark;
          public          postgres    false    216            �            1259    16400    snakers    TABLE     ?  CREATE TABLE public.snakers (
    id_snaker bigint NOT NULL,
    titlle text,
    description text,
    price numeric,
    count_stock integer,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    deleted_at timestamp without time zone,
    id_mark integer,
    path_img text
);
    DROP TABLE public.snakers;
       public         heap    postgres    false    4            �            1259    16399    snakers_id_snaker_seq    SEQUENCE     ~   CREATE SEQUENCE public.snakers_id_snaker_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.snakers_id_snaker_seq;
       public          postgres    false    215    4                       0    0    snakers_id_snaker_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.snakers_id_snaker_seq OWNED BY public.snakers.id_snaker;
          public          postgres    false    214            w           2604    16422    clients id_client    DEFAULT     v   ALTER TABLE ONLY public.clients ALTER COLUMN id_client SET DEFAULT nextval('public.clients_id_client_seq'::regclass);
 @   ALTER TABLE public.clients ALTER COLUMN id_client DROP DEFAULT;
       public          postgres    false    220    221    221            u           2604    16410    marks id_mark    DEFAULT     n   ALTER TABLE ONLY public.marks ALTER COLUMN id_mark SET DEFAULT nextval('public.marks_id_mark_seq'::regclass);
 <   ALTER TABLE public.marks ALTER COLUMN id_mark DROP DEFAULT;
       public          postgres    false    216    217    217            v           2604    16417    marks_clients_prices id_cmp    DEFAULT     �   ALTER TABLE ONLY public.marks_clients_prices ALTER COLUMN id_cmp SET DEFAULT nextval('public.marks_clients_prices_id_cmp_seq'::regclass);
 J   ALTER TABLE public.marks_clients_prices ALTER COLUMN id_cmp DROP DEFAULT;
       public          postgres    false    218    219    219            t           2604    16403    snakers id_snaker    DEFAULT     v   ALTER TABLE ONLY public.snakers ALTER COLUMN id_snaker SET DEFAULT nextval('public.snakers_id_snaker_seq'::regclass);
 @   ALTER TABLE public.snakers ALTER COLUMN id_snaker DROP DEFAULT;
       public          postgres    false    215    214    215                      0    16419    clients 
   TABLE DATA           W   COPY public.clients (id_client, name, created_at, modified_at, deleted_at) FROM stdin;
    public          postgres    false    221   D!       	          0    16407    marks 
   TABLE DATA           S   COPY public.marks (id_mark, name, created_at, modified_at, deleted_at) FROM stdin;
    public          postgres    false    217   �!                 0    16414    marks_clients_prices 
   TABLE DATA           z   COPY public.marks_clients_prices (id_cmp, id_client, id_mark, created_at, modified_at, deleted_at, descuento) FROM stdin;
    public          postgres    false    219   "                 0    16400    snakers 
   TABLE DATA           �   COPY public.snakers (id_snaker, titlle, description, price, count_stock, created_at, modified_at, deleted_at, id_mark, path_img) FROM stdin;
    public          postgres    false    215   \"                  0    0    clients_id_client_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.clients_id_client_seq', 3, true);
          public          postgres    false    220                       0    0    marks_clients_prices_id_cmp_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.marks_clients_prices_id_cmp_seq', 3, true);
          public          postgres    false    218                       0    0    marks_id_mark_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.marks_id_mark_seq', 4, true);
          public          postgres    false    216                       0    0    snakers_id_snaker_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.snakers_id_snaker_seq', 12, true);
          public          postgres    false    214               Z   x�3�LN,��/VH6�4202�50�52U04�24�26�3001�4��".#Μ�L�R#�JML�͠J�9���*��q(553�)����� �&      	   P   x�3��u�4202�50�52U04�20�26�32�46����".#N?OoW��9��]�=\��	�5�t�t&Ba� y�"         >   x�3�4B##]c]#SC+CS+3=#ssc#�?24�2�C"Ts� 1*c���� L�         �	  x��X�n�]���Yd�O���E`+�@V�6�n�nΈ2��KvO,���^x�p��r�Ȟ=;�����ͪs��)��eu�;k�]�S饽���u'k鵕ٹ4��7+d�e��)>x-����ݽ �چFc��02�F۶���R�.�u�ˡ8W��Am�%����W��(�J]�J\e�
�6�H��4�VN�x�l��~í2.�z-[C;,�ԅ��8���+�8��.����
��)lR������m^+;�7/+Uoo�Q
�R
��V�P.�>�B�ղ_WH��c�+%�M$���:-K�mt���7C'7j(�L��r4�Ũ�d�qVLE>y1�����|�(ƃ_N���m������J�?��J�zX��>o��V��l��ƋQ�,�l�5�U]�����<Oprƨ�i�8Uk����e���ҥ�?6��|+"ʻ_Ȅ�Ґ�p�S�V^��s���v^����/�I�R����|���jW!���#8z-���̵�1ZR�i�Qt��F��u�D�=��?X���/!�M+/�:�1tAx�!N�_u�f�T�$�
�ժҮ�ۯ)���Z]!�*�h*P��5X�v�ݒugZ]iO�8+��?a?�v��qd���8K�����b_+�o�����cN�²-�F��wa8(��ӲfR��l�\L�q��wY�Hs�W��Q"%��|��wү�g߽�,��J���vW�I@��"x�[���1������52���P�్V���v��DKB>D��J�m������NS�I*:N�U��x݅�x6�\�'3�Q2I��l�g��h:���e� ���R靑���2\��pt¥��I!p��2K��)r����A"m�`lgKy�i��t��Π24���f��*�H�����u�%*�+�u5�d!��QB^�K�]�"ݐ@���F�J`�cmo�JB����TsDq|��1�9*ES��0J��b�48DXjV�U�Β�d-?��?�t^,�|��F�b���`%eP#�ǐ$�6�w��&�JL��j�L�ZAeA�J�����«kU;��ꂄ��b`�$���5�Q>�+���b��3ԙ���T�$�te_^�R����o7\���F��.FbM�Wx�jQ�k[��F�N�(ܸ�m%I��_m�%3ǒ��}�n{
��=�e-�==)���b���U�$���Km�aў��J�(��J���8=;��L��$y� �n�K�*�A��Ee�߁�WA�ky^�������RlF�Kee�C�oo��.>'��7	�`�W� Ml����*�P~c��Eg��Ɂ�K��7����Zd��e$Z�~� F	$�G�SpU��.S+աWmĊ�um�"8���?��n��l_
���g���k�WT8��Xh�*��ס�,�hM�-q��n�j,�R0&�l�@�qb��ł�*����y2�In?��Ʋ�h6�&��|����t��J�|yә�]TQ�������G��t����t��
+�[�֒�w��Ҧ��)���՘�H�� ���S�;�J��`m�͡
��%]gƳ������D�PÏ�*Qcp�A���y� Y��^�5lۉ6ꧣ] ��h$�W� ƨz������ D��;�-[�3IR7b��ZG��|)�#�!(��
V�3�{������z	�z�&/���W�f�y��"�N�F������rC�Q��V(uxr��@�?��:H�Mf]�R������27��y6Y�G�+�;̝=`n$�,L�j���x���Q7��ȹN=B:dsϪ��T���Ycbh��>��ō���nI]����A�\H�h��O��*!X�Q�1p��M4^��"�vQ��]S��D0:��*�xR,'��,[���3���9�4����g��_�wu�ې��t Td��c��o���{N�b�[*FRvu��}�?[~ع���
�V�Ѫ+�^�y��
Tө��]K8��?��gh���.�w�v�Z�q��o�K	��ͦID����\�\{��g��Gx���l�/��r��-Q�w0[<�j�%2qg*�I���_tX���Ik��<Y�- ���O�j{[jV��#��t�T�.��l-!�;�<��P����P�'�O&�,������>���am-fO��x2��0��~M.�㻛P�AЯ���\�����K�q�����q�`�>t������bLo�_�r���?����`�K2�2�Ey_���G�֑��������,�6�D���)`Ό&[K&O��ꚽ0�/�b���Tŋ哣�,f�l1�d��t�xx�ǽ����&�(��5�U<�{�XP~V����S�H�\GgI��ͅ�Ν��.� fW!r̷��K]Ѫǰ���@~�'[��@�и뤼�'l�m=g���|����'[����6W�9��dw���K���p@0_tM��Vi�8"P���պ|�#��b9����t
�J�/�gϞ�j+#�     